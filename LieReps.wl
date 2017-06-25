(* ::Package:: *)

BeginPackage["LieReps`"]

LieAlgebra::usage="Gives an Association with Lie algebra data.";

(* TODO: move these to private, and then expose via 'usage' as above *)

ApplyWeylGroup[liealgebra_,weights_] := DeleteDuplicates[Flatten[Table[m.w,{w,weights},{m,liealgebra["WeylGroup"]}],1]];

HighestWeightRep[liealgebra_,highestweight_] := Module[{weights,weightspaces,weight},
	weights=WeightSpaces[liealgebra,highestweight];
	weightspaces=AssociationMap[0&,weights];
	weightspaces[highestweight]=1;

	While[(weight=Flatten[Keys[Select[weightspaces,#==0&,1]],1])!={},
		weightspaces=ComputeDimension[liealgebra,weightspaces,weight,highestweight,ConstantArray[1,liealgebra["Rank"]]];
	];
	
	Return[weightspaces];
];

(* TODO: change to helper function taking in positive roots to eliminate multi-calculation? *)
ComputeDimension[liealgebra_,inweightdata_,weight_,highestweight_,delta_] := Module[{weightdata,cbpositiveroots,dim,currweight,i},
	If[inweightdata[weight]!=0,Return[inweightdata]];
	
	weightdata=inweightdata;
	cbpositiveroots=liealgebra["PositiveRoots"].liealgebra["CartanMatrix"];
	dim=0;
	
	For[i=1,i<=Length[cbpositiveroots],i++,
		currweight=weight;
		While[MemberQ[Keys[weightdata],currweight+=cbpositiveroots[[i]]],
			weightdata=ComputeDimension[liealgebra,weightdata,currweight,highestweight,delta];
			dim+=weightdata[currweight]*Dot[currweight,liealgebra["InvariantForm"].cbpositiveroots[[i]]];
		];
	];
	
	dim*=2/(Dot[highestweight+delta,liealgebra["InvariantForm"].(highestweight+delta)]-Dot[weight+delta,liealgebra["InvariantForm"].(weight+delta)]);
	weightdata[weight]=dim;
	
	Return[weightdata];
];

DominantWeights[liealgebra_,highestweight_] := Module[{cbhighestweight,cbdomweights},
	(* Change to root coordinates - should this be transpose? *)
	cbhighestweight=Inverse[Transpose[liealgebra["CartanMatrix"]]].highestweight;
	cbdomweights=Flatten[CoordinateBoundsArray[Table[{w,0},{w,cbhighestweight}],-1],Length[highestweight]-1];
	
	(* Change back to weight coordinates, remove non-dominant *)
	Return[DeleteCases[Transpose[Transpose[liealgebra["CartanMatrix"]].Transpose[cbdomweights]], (x_ /;Min[x]<0)]];
];

WeightSpaces[liealgebra_,highestweight_] := Module[{domweights},
	domweights=DominantWeights[liealgebra,highestweight];
	Return[ApplyWeylGroup[liealgebra,domweights]];
];

(* The next few modules are specifically for sl3 currently. *)
Irrep[highestweight_] := Module[{minw, maxw, hexagonshells,triangleshells},
	minw=Min[highestweight];
	maxw=Max[highestweight];
	hexagonshells=Association[Table[ShellWeights[highestweight-i,i+1],{i,0,minw-1}]];
	triangleshells=Association[Table[ShellWeights[Max[#,0]&/@(highestweight-i),minw+1], {i,minw,maxw,3}]];
	Return [Join[hexagonshells,triangleshells]];
];

(* Function which takes a 'corner' of a hexagon/triangle and produces all the weights in the hexagon/triangle
All weights are in the basis of the fundamental dominant weights
The roots are in the basis of the simple roots *)
ShellWeights[dominantweight_, dim_] := Module[{weights,nextweight},
	(*First deal with trivial rep*)
	If[dominantweight=={0,0},Return[<|{0,0}->dim|>]];

	weights=<|dominantweight->dim|>;
	(* Gets edge in alpha direction (top of hexagon) *)
	weights = Join[weights,Edge[dominantweight,dim,{1,0}]];
	nextweight=Last[Keys[weights]];
	(* Gets edge in alpha+beta direction, etc. *)
	weights=Join[weights,Edge[nextweight,dim,{1,1}]];
	nextweight=Last[Keys[weights]];
	weights=Join[weights,Edge[nextweight,dim,{0,1}]];
	nextweight=Last[Keys[weights]];
	weights=Join[weights,Edge[nextweight,dim,{1,0}]];
	nextweight=Last[Keys[weights]];
	weights=Join[weights,Edge[nextweight,dim,{1,1}]];
	nextweight=Last[Keys[weights]];
	weights=Join[weights,Edge[nextweight,dim,{0,1}]];

	Return[weights];
];

(* Takes extremal weight of sl_2 module corresponding to root, gets all weights from that rep *)
Edge[weight_, dim_,root_] := Module[{n,cartanmatrix},
	n=Dot[weight,root];
	
	(* Used to change basis from simple roots to fundamental dominant weight *)
	cartanmatrix={{2,-1},{-1,2}};
	
	Return[If[n<0,
		Association[Table[(weight+x*(cartanmatrix.root))->dim,{x,1,-n}]],
		Association[Table[(weight-x*(cartanmatrix.root))->dim,{x,1,n}]]]
	];
];

(* Plots a given collection of weights in Euclidean coordinates *)
PlotWeights[weights_] := Module[{cobmatrix},
	cobmatrix={{Sqrt[3]/2,0},{1/2,1}};
	Return[
		BubbleChart[Table[Append[cobmatrix.pt,weights[pt]],{pt,Keys[weights]}], Frame->False,Axes->True,AxesOrigin->{0,0}AspectRatio->1]
	];
];

Begin["`Private`"]

LieAlgebra[type_,rank_] := Module[{data},
	data=<||>;
	data["Type"]=type;
	data["Rank"]=rank;
	data["CartanMatrix"]=CartanMatrix[type,rank];
	data["PositiveRoots"]=PositiveRoots[data["CartanMatrix"]];
	data["WeylGroup"]=WeylGroup[type,rank];
	data["InvariantForm"]=InvariantForm[type,rank];
	
	Return[data];
];

CartanMatrix[type_,rank_] := Module[{cartanA},
	If[rank==1,Return[{{2}}]];
	
	cartanA=DiagonalMatrix[ConstantArray[2,rank]] + DiagonalMatrix[ConstantArray[-1,rank-1],1] + DiagonalMatrix[ConstantArray[-1,rank-1], -1];
	Return[Switch[type,
		"A",cartanA,
		"B",cartanA+SparseArray[{{rank-1,rank}->-1},{rank,rank}],
		"C",cartanA+SparseArray[{{rank,rank-1}->-1},{rank,rank}],
		"D",cartanA+SparseArray[{{rank-1,rank}->1,{rank,rank-1}->1,{rank-2,rank}->-1,{rank,rank-2}->-1},{rank,rank}],
		"G",If[rank==2,{{2,-1},{-3,2}}]
	]];
];

PositiveRoots[cartanmatrix_] := Module[{rank,simpleroots,posroots,currroots,nextroots,n},
	rank=Length[cartanmatrix];
	simpleroots=IdentityMatrix[rank];
	posroots={};
	currroots=simpleroots;
	nextroots={};
	
	While[Length[currroots]>0,
		(* add new roots *)
		nextroots=Union[nextroots,
			Flatten[Table[croot+k*sroot,
				{sroot,simpleroots},
				{croot,currroots},
				{k,-Dot[croot,cartanmatrix.sroot]}
			],2]
		];
		
		(* update roots lists for next iteration *)
		nextroots=Complement[nextroots,posroots];
		posroots=Union[posroots,currroots];
		currroots=nextroots;
		nextroots={};
	];
	
	Return[posroots];
];

WeylGroup[type_,rank_,inrootbasis_:False] := Module[{permmatrices,cbroot2coord,cbcoord2root,cartanmatrix,signs,group,cobmatrix},
	If[type=="A",
		If[rank==1, Return[{{{1}},{{-1}}}]];
		permmatrices = Table[IdentityMatrix[rank+1][[perm]],{perm ,Permutations[Range[rank+1]]}];
		cbroot2coord = Join[IdentityMatrix[rank],{ConstantArray[0,rank]}]-Join[{ConstantArray[0,rank]},IdentityMatrix[rank]];
		cbcoord2root = LowerTriangularize[ConstantArray[1,{rank,rank+1}]];
		cartanmatrix = DiagonalMatrix[ConstantArray[2,rank]] + DiagonalMatrix[ConstantArray[-1,rank-1],1] + DiagonalMatrix[ConstantArray[-1,rank-1], -1];
		
		If[inrootbasis,
			Return[Table[cbcoord2root.P.cbroot2coord, {P,permmatrices}]],
			Return[Table[cartanmatrix.cbcoord2root.P.cbroot2coord.Inverse[cartanmatrix],{P,permmatrices}]];
		];
	];

	If[type=="B"||type=="C",
		permmatrices = Table[IdentityMatrix[rank][[perm]],{perm ,Permutations[Range[rank]]}];
		signs=(-1)^Tuples[{0,1},rank];
		group=Flatten[Table[permmatrices[[i]]*signs[[j]],{i,1,Length[permmatrices]},{j,1,Length[signs]}],1];
		
		If[type=="B",
			cobmatrix=UpperTriangularize[Table[1,{i,1,rank},{j,1,rank}]];
			cobmatrix[[All,rank]]=cobmatrix[[All,rank]]/2;
			Return[Table[Inverse[cobmatrix].P.cobmatrix,{P,group}]]
		];
		
		If[type=="C",
			cobmatrix=UpperTriangularize[Table[1,{i,1,rank},{j,1,rank}]];
			Return[Table[Inverse[cobmatrix].P.cobmatrix,{P,group}]]
		];
	];
	
	If[type=="D",
		permmatrices = Table[IdentityMatrix[rank][[perm]],{perm ,Permutations[Range[rank]]}];
		signs=DeleteCases[(-1)^Tuples[{0,1},rank],x_ /;Apply[Times,x]==-1];
		group=Flatten[Table[permmatrices[[i]]*signs[[j]],{i,1,Length[permmatrices]},{j,1,Length[signs]}],1];
		cobmatrix=UpperTriangularize[Table[1,{i,1,rank},{j,1,rank}]];
		cobmatrix[[All,rank-1]]=cobmatrix[[All,rank-1]]/2;
		cobmatrix[[rank,rank-1]]=-1/2;
		cobmatrix[[All,rank]]=cobmatrix[[All,rank]]/2;
		Return[Table[Inverse[cobmatrix].P.cobmatrix,{P,group}]];
	];
];

InvariantForm[type_,rank_] := Module[{matrix},
	Switch[type,
		"A",
			Return[Table[(Min[i,j]*((rank+1)-Max[i,j]))/(rank+1),{i,1,rank},{j,1,rank}]];
		"B",
			matrix=Table[Min[i,j],{i,1,rank},{j,1,rank}];
			matrix[[rank]]=matrix[[rank]]/2;
			matrix[[All,rank]]=matrix[[All,rank]]/2;
			Return[matrix];
		"C",
			Return[Table[Min[i,j],{i,1,rank},{j,1,rank}]];
		"D",
			matrix=Table[Min[i,j],{i,1,rank},{j,1,rank}];
			matrix[[rank-1]]=matrix[[rank-1]]/2;
			matrix[[rank]]=matrix[[rank]]/2;
			matrix[[All,rank-1]]=matrix[[All,rank-1]]/2;
			matrix[[All,rank]]=matrix[[All,rank]]/2;
			matrix[[rank-1,rank-1]]=rank/4;
			matrix[[rank,rank]]=rank/4;
			matrix[[rank-1,rank]]=(rank-2)/4;
			matrix[[rank,rank-1]]=(rank-2)/4;
			Return[matrix];
	];
];

End[]
EndPackage[]
