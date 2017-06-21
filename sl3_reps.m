(* Content-type: application/vnd.wolfram.mathematica *)

(*** Wolfram Notebook File ***)
(* http://www.wolfram.com/nb *)

(* CreatedBy='Mathematica 11.0' *)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       158,          7]
NotebookDataLength[     33955,        877]
NotebookOptionsPosition[     33707,        864]
NotebookOutlinePosition[     34054,        879]
CellTagsIndexPosition[     34011,        876]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"WeylGroup", "[", 
    RowBox[{"rank_", ",", 
     RowBox[{"type_:", "A"}], ",", 
     RowBox[{"inrootbasis_:", "False"}]}], "]"}], " ", ":=", " ", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "permmatrices", ",", "cbroot2coord", ",", "cbcoord2root", ",", 
       "cartanmatrix", ",", "signs", ",", "group", ",", "cobmatrix"}], "}"}], 
     ",", "\n", 
     RowBox[{"(*", 
      RowBox[{
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"type", "=!=", "A"}], ",", " ", 
         RowBox[{
          RowBox[{"Return", "[", "Null", "]"}], ";"}]}], "]"}], ";"}], "*)"}],
      "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"type", "\[Equal]", "A"}], ",", "\n", 
        RowBox[{
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"rank", "==", "1"}], ",", " ", 
           RowBox[{
            RowBox[{"Return", "[", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{"{", "1", "}"}], "}"}], ",", 
               RowBox[{"{", 
                RowBox[{"{", 
                 RowBox[{"-", "1"}], "}"}], "}"}]}], "}"}], "]"}], ";"}]}], 
          "]"}], ";", "\n", 
         RowBox[{"permmatrices", " ", "=", " ", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"IdentityMatrix", "[", 
              RowBox[{"rank", "+", "1"}], "]"}], "[", 
             RowBox[{"[", "perm", "]"}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"perm", " ", ",", 
              RowBox[{"Permutations", "[", 
               RowBox[{"Range", "[", 
                RowBox[{"rank", "+", "1"}], "]"}], "]"}]}], "}"}]}], "]"}]}], 
         ";", "\n", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"type", "\[Equal]", "A"}], ",", "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{"cbroot2coord", " ", "=", " ", 
             RowBox[{
              RowBox[{"Join", "[", 
               RowBox[{
                RowBox[{"IdentityMatrix", "[", "rank", "]"}], ",", 
                RowBox[{"{", 
                 RowBox[{"ConstantArray", "[", 
                  RowBox[{"0", ",", "rank"}], "]"}], "}"}]}], "]"}], "-", 
              RowBox[{"Join", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{"ConstantArray", "[", 
                  RowBox[{"0", ",", "rank"}], "]"}], "}"}], ",", 
                RowBox[{"IdentityMatrix", "[", "rank", "]"}]}], "]"}]}]}], 
            ";", "\n", 
            RowBox[{"cbcoord2root", " ", "=", " ", 
             RowBox[{"LowerTriangularize", "[", 
              RowBox[{"ConstantArray", "[", 
               RowBox[{"1", ",", 
                RowBox[{"{", 
                 RowBox[{"rank", ",", 
                  RowBox[{"rank", "+", "1"}]}], "}"}]}], "]"}], "]"}]}], ";", 
            "\n", 
            RowBox[{"cartanmatrix", " ", "=", " ", 
             RowBox[{
              RowBox[{"DiagonalMatrix", "[", 
               RowBox[{"ConstantArray", "[", 
                RowBox[{"2", ",", "rank"}], "]"}], "]"}], " ", "+", " ", 
              RowBox[{"DiagonalMatrix", "[", 
               RowBox[{
                RowBox[{"ConstantArray", "[", 
                 RowBox[{
                  RowBox[{"-", "1"}], ",", 
                  RowBox[{"rank", "-", "1"}]}], "]"}], ",", "1"}], "]"}], " ",
               "+", " ", 
              RowBox[{"DiagonalMatrix", "[", 
               RowBox[{
                RowBox[{"ConstantArray", "[", 
                 RowBox[{
                  RowBox[{"-", "1"}], ",", 
                  RowBox[{"rank", "-", "1"}]}], "]"}], ",", " ", 
                RowBox[{"-", "1"}]}], "]"}]}]}], ";", "\n", 
            RowBox[{"If", "[", 
             RowBox[{"inrootbasis", ",", "\n", 
              RowBox[{
               RowBox[{"Return", "[", 
                RowBox[{"Table", "[", 
                 RowBox[{
                  RowBox[{"cbcoord2root", ".", "P", ".", "cbroot2coord"}], 
                  ",", " ", 
                  RowBox[{"{", 
                   RowBox[{"P", ",", "permmatrices"}], "}"}]}], "]"}], "]"}], 
               ";"}], ",", "\n", 
              RowBox[{
               RowBox[{"Return", "[", 
                RowBox[{"Table", "[", 
                 RowBox[{
                  RowBox[{
                  "cartanmatrix", ".", "cbcoord2root", ".", "P", ".", 
                   "cbroot2coord", ".", 
                   RowBox[{"Inverse", "[", "cartanmatrix", "]"}]}], ",", " ", 
                  RowBox[{"{", 
                   RowBox[{"P", ",", "permmatrices"}], "}"}]}], "]"}], "]"}], 
               ";"}]}], "\n", "]"}], ";"}]}], "\[IndentingNewLine]", "]"}], 
         ";"}]}], "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
      "\[IndentingNewLine]", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"type", "\[Equal]", "B"}], "||", 
         RowBox[{"type", "\[Equal]", "C"}]}], ",", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"permmatrices", " ", "=", " ", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"IdentityMatrix", "[", "rank", "]"}], "[", 
             RowBox[{"[", "perm", "]"}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"perm", " ", ",", 
              RowBox[{"Permutations", "[", 
               RowBox[{"Range", "[", "rank", "]"}], "]"}]}], "}"}]}], "]"}]}],
          ";", "\[IndentingNewLine]", 
         RowBox[{"signs", "=", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"-", "1"}], ")"}], "^", 
           RowBox[{"Tuples", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"0", ",", "1"}], "}"}], ",", "rank"}], "]"}]}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{"group", "=", 
          RowBox[{"Flatten", "[", 
           RowBox[{
            RowBox[{"Table", "[", 
             RowBox[{
              RowBox[{
               RowBox[{"permmatrices", "[", 
                RowBox[{"[", "i", "]"}], "]"}], "*", 
               RowBox[{"signs", "[", 
                RowBox[{"[", "j", "]"}], "]"}]}], ",", 
              RowBox[{"{", 
               RowBox[{"i", ",", "1", ",", 
                RowBox[{"Length", "[", "permmatrices", "]"}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"j", ",", "1", ",", 
                RowBox[{"Length", "[", "signs", "]"}]}], "}"}]}], "]"}], ",", 
            "1"}], "]"}]}], ";", "\[IndentingNewLine]", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"type", "\[Equal]", "B"}], ",", "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{"cobmatrix", "=", 
             RowBox[{"UpperTriangularize", "[", 
              RowBox[{"Table", "[", 
               RowBox[{"1", ",", 
                RowBox[{"{", 
                 RowBox[{"i", ",", "1", ",", "rank"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"j", ",", "1", ",", "rank"}], "}"}]}], "]"}], 
              "]"}]}], ";", "\[IndentingNewLine]", 
            RowBox[{
             RowBox[{"cobmatrix", "[", 
              RowBox[{"[", 
               RowBox[{"All", ",", "rank"}], "]"}], "]"}], "=", 
             RowBox[{
              RowBox[{"cobmatrix", "[", 
               RowBox[{"[", 
                RowBox[{"All", ",", "rank"}], "]"}], "]"}], "/", "2"}]}], ";",
             "\[IndentingNewLine]", 
            RowBox[{"Return", "[", 
             RowBox[{"Table", "[", 
              RowBox[{
               RowBox[{
                RowBox[{"Inverse", "[", "cobmatrix", "]"}], ".", "P", ".", 
                "cobmatrix"}], ",", 
               RowBox[{"{", 
                RowBox[{"P", ",", "group"}], "}"}]}], "]"}], "]"}]}]}], 
          "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"type", "\[Equal]", "C"}], ",", "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{"cobmatrix", "=", 
             RowBox[{"UpperTriangularize", "[", 
              RowBox[{"Table", "[", 
               RowBox[{"1", ",", 
                RowBox[{"{", 
                 RowBox[{"i", ",", "1", ",", "rank"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"j", ",", "1", ",", "rank"}], "}"}]}], "]"}], 
              "]"}]}], ";", "\[IndentingNewLine]", 
            RowBox[{"Return", "[", 
             RowBox[{"Table", "[", 
              RowBox[{
               RowBox[{
                RowBox[{"Inverse", "[", "cobmatrix", "]"}], ".", "P", ".", 
                "cobmatrix"}], ",", 
               RowBox[{"{", 
                RowBox[{"P", ",", "group"}], "}"}]}], "]"}], "]"}]}]}], 
          "\[IndentingNewLine]", "]"}], ";"}]}], "\[IndentingNewLine]", "]"}],
       ";", "\[IndentingNewLine]", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"type", "\[Equal]", "D"}], ",", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"permmatrices", " ", "=", " ", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"IdentityMatrix", "[", "rank", "]"}], "[", 
             RowBox[{"[", "perm", "]"}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"perm", " ", ",", 
              RowBox[{"Permutations", "[", 
               RowBox[{"Range", "[", "rank", "]"}], "]"}]}], "}"}]}], "]"}]}],
          ";", "\[IndentingNewLine]", 
         RowBox[{"signs", "=", 
          RowBox[{"DeleteCases", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"(", 
              RowBox[{"-", "1"}], ")"}], "^", 
             RowBox[{"Tuples", "[", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{"0", ",", "1"}], "}"}], ",", "rank"}], "]"}]}], ",", 
            RowBox[{"x_", " ", "/;", 
             RowBox[{
              RowBox[{"Apply", "[", 
               RowBox[{"Times", ",", "x"}], "]"}], "\[Equal]", 
              RowBox[{"-", "1"}]}]}]}], "]"}]}], ";", "\[IndentingNewLine]", 
         RowBox[{"group", "=", 
          RowBox[{"Flatten", "[", 
           RowBox[{
            RowBox[{"Table", "[", 
             RowBox[{
              RowBox[{
               RowBox[{"permmatrices", "[", 
                RowBox[{"[", "i", "]"}], "]"}], "*", 
               RowBox[{"signs", "[", 
                RowBox[{"[", "j", "]"}], "]"}]}], ",", 
              RowBox[{"{", 
               RowBox[{"i", ",", "1", ",", 
                RowBox[{"Length", "[", "permmatrices", "]"}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"j", ",", "1", ",", 
                RowBox[{"Length", "[", "signs", "]"}]}], "}"}]}], "]"}], ",", 
            "1"}], "]"}]}], ";", "\[IndentingNewLine]", 
         RowBox[{"cobmatrix", "=", 
          RowBox[{"UpperTriangularize", "[", 
           RowBox[{"Table", "[", 
            RowBox[{"1", ",", 
             RowBox[{"{", 
              RowBox[{"i", ",", "1", ",", "rank"}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"j", ",", "1", ",", "rank"}], "}"}]}], "]"}], "]"}]}], 
         ";", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"cobmatrix", "[", 
           RowBox[{"[", 
            RowBox[{"All", ",", 
             RowBox[{"rank", "-", "1"}]}], "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"cobmatrix", "[", 
            RowBox[{"[", 
             RowBox[{"All", ",", 
              RowBox[{"rank", "-", "1"}]}], "]"}], "]"}], "/", "2"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"cobmatrix", "[", 
           RowBox[{"[", 
            RowBox[{"rank", ",", 
             RowBox[{"rank", "-", "1"}]}], "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"-", "1"}], "/", "2"}]}], ";", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"cobmatrix", "[", 
           RowBox[{"[", 
            RowBox[{"All", ",", "rank"}], "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"cobmatrix", "[", 
            RowBox[{"[", 
             RowBox[{"All", ",", "rank"}], "]"}], "]"}], "/", "2"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{"Return", "[", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"Inverse", "[", "cobmatrix", "]"}], ".", "P", ".", 
             "cobmatrix"}], ",", 
            RowBox[{"{", 
             RowBox[{"P", ",", "group"}], "}"}]}], "]"}], "]"}], ";"}]}], 
       "\[IndentingNewLine]", "]"}]}]}], "\n", "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"ApplyWeylGroup", "[", 
     RowBox[{"weights_", ",", "weylgroup_"}], "]"}], " ", ":=", " ", 
    RowBox[{"DeleteDuplicates", "[", 
     RowBox[{"Flatten", "[", 
      RowBox[{
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"m", ".", "w"}], ",", 
         RowBox[{"{", 
          RowBox[{"w", ",", "weights"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"m", ",", "weylgroup"}], "}"}]}], "]"}], ",", "1"}], "]"}], 
     "]"}]}], ";"}], "\n"}], "\n", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"DominantWeights", "[", 
     RowBox[{"highestweight_", ",", "cartanmatrix_"}], "]"}], " ", ":=", " ", 
    RowBox[{"Module", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"cbhighestweight", ",", "cbdomweights"}], "}"}], ",", "\n", 
      RowBox[{"(*", " ", 
       RowBox[{
        RowBox[{"Change", " ", "to", " ", "root", " ", "coordinates"}], " ", 
        "-", " ", 
        RowBox[{"should", " ", "this", " ", "be", " ", 
         RowBox[{"transpose", "?"}]}]}], " ", "*)"}], "\n", 
      RowBox[{
       RowBox[{"cbhighestweight", "=", 
        RowBox[{
         RowBox[{"Inverse", "[", "cartanmatrix", "]"}], ".", 
         "highestweight"}]}], ";", "\n", 
       RowBox[{"cbdomweights", "=", 
        RowBox[{"Flatten", "[", 
         RowBox[{
          RowBox[{"CoordinateBoundsArray", "[", 
           RowBox[{
            RowBox[{"Table", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"w", ",", "0"}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"w", ",", "cbhighestweight"}], "}"}]}], "]"}], ",", 
            RowBox[{"-", "1"}]}], "]"}], ",", "1"}], "]"}]}], ";", "\n", 
       RowBox[{"(*", " ", 
        RowBox[{
         RowBox[{
         "Change", " ", "back", " ", "to", " ", "weight", " ", 
          "coordinates"}], ",", " ", 
         RowBox[{
          RowBox[{"remove", " ", "non"}], "-", "dominant"}]}], " ", "*)"}], 
       "\n", 
       RowBox[{"Return", "[", 
        RowBox[{"DeleteCases", "[", 
         RowBox[{
          RowBox[{"Transpose", "[", 
           RowBox[{"cartanmatrix", ".", 
            RowBox[{"Transpose", "[", "cbdomweights", "]"}]}], "]"}], ",", 
          " ", 
          RowBox[{"(", 
           RowBox[{"x_", " ", "/;", 
            RowBox[{
             RowBox[{"Min", "[", 
              RowBox[{
               RowBox[{"x", "[", 
                RowBox[{"[", "1", "]"}], "]"}], ",", 
               RowBox[{"x", "[", 
                RowBox[{"[", "2", "]"}], "]"}]}], "]"}], "<", "0"}]}], 
           ")"}]}], "]"}], "]"}], ";"}]}], "\n", "]"}]}], ";"}], "\n"}], "\n", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"Irrep", "[", "highestweight_", "]"}], " ", ":=", " ", 
    RowBox[{"Module", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
       "minw", ",", " ", "maxw", ",", " ", "hexagonshells", ",", 
        "triangleshells"}], "}"}], ",", "\n", 
      RowBox[{
       RowBox[{"minw", "=", 
        RowBox[{"Min", "[", "highestweight", "]"}]}], ";", "\n", 
       RowBox[{"maxw", "=", 
        RowBox[{"Max", "[", "highestweight", "]"}]}], ";", "\n", 
       RowBox[{"hexagonshells", " ", "=", " ", 
        RowBox[{"Association", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"ShellWeights", "[", 
            RowBox[{
             RowBox[{"highestweight", "-", "i"}], ",", 
             RowBox[{"i", "+", "1"}]}], "]"}], ",", " ", 
           RowBox[{"{", 
            RowBox[{"i", ",", "0", ",", 
             RowBox[{"minw", "-", "1"}]}], "}"}]}], "]"}], "]"}]}], ";", "\n", 
       RowBox[{"triangleshells", " ", "=", " ", 
        RowBox[{"Association", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"ShellWeights", "[", 
            RowBox[{
             RowBox[{
              RowBox[{
               RowBox[{"Max", "[", 
                RowBox[{"#", ",", "0"}], "]"}], "&"}], "/@", 
              RowBox[{"(", 
               RowBox[{"highestweight", "-", "i"}], ")"}]}], ",", 
             RowBox[{"minw", "+", "1"}]}], "]"}], ",", " ", 
           RowBox[{"{", 
            RowBox[{"i", ",", "minw", ",", "maxw", ",", "3"}], "}"}]}], "]"}],
          "]"}]}], ";", "\n", 
       RowBox[{"Return", " ", "[", 
        RowBox[{"Join", "[", 
         RowBox[{"hexagonshells", ",", "triangleshells"}], "]"}], "]"}], 
       ";"}]}], "\n", "]"}]}], ";"}], "\n", "\n", 
  RowBox[{"(*", " ", 
   RowBox[{"Function", " ", "which", " ", "takes", " ", 
    RowBox[{"a", " ", "'"}], 
    RowBox[{"corner", "'"}], " ", "of", " ", "a", " ", 
    RowBox[{"hexagon", "/", "triangle"}], " ", "and", " ", "produces", " ", 
    "all", " ", "the", " ", "weights", " ", "in", " ", "the", " ", 
    RowBox[{"hexagon", "/", "triangle"}], "\n", "All", " ", "weights", " ", 
    "are", " ", "in", " ", "the", " ", "basis", " ", "of", " ", "the", " ", 
    "fundamental", " ", "dominant", " ", "weights", "\n", "The", " ", "roots",
     " ", "are", " ", "in", " ", "the", " ", "basis", " ", "of", " ", "the", 
    " ", "simple", " ", "roots"}], " ", "*)"}]}], "\n", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"ShellWeights", "[", 
     RowBox[{"dominantweight_", ",", " ", "dim_"}], "]"}], ":=", 
    RowBox[{"Module", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"weights", ",", "nextweight"}], "}"}], ",", "\n", 
      RowBox[{"(*", 
       RowBox[{
       "First", " ", "deal", " ", "with", " ", "trivial", " ", "rep"}], 
       "*)"}], "\n", 
      RowBox[{
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"dominantweight", "==", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0"}], "}"}]}], ",", 
         RowBox[{
          RowBox[{"Return", "[", 
           RowBox[{"<|", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"0", ",", "0"}], "}"}], "->", "dim"}], "|>"}], "]"}], 
          ";"}]}], "]"}], ";", "\n", "\n", 
       RowBox[{"weights", "=", 
        RowBox[{"<|", 
         RowBox[{"dominantweight", "->", "dim"}], "|>"}]}], ";", "\n", 
       RowBox[{"(*", " ", 
        RowBox[{
        "Gets", " ", "edge", " ", "in", " ", "alpha", " ", "direction", " ", 
         RowBox[{"(", 
          RowBox[{"top", " ", "of", " ", "hexagon"}], ")"}]}], " ", "*)"}], 
       "\n", 
       RowBox[{"weights", " ", "=", " ", 
        RowBox[{"Join", "[", 
         RowBox[{"weights", ",", 
          RowBox[{"Edge", "[", 
           RowBox[{"dominantweight", ",", "dim", ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "0"}], "}"}]}], "]"}]}], "]"}]}], ";", "\n", 
       RowBox[{"nextweight", "=", 
        RowBox[{"Last", "[", 
         RowBox[{"Keys", "[", "weights", "]"}], "]"}]}], ";", "\n", 
       RowBox[{"(*", " ", 
        RowBox[{
         RowBox[{
          RowBox[{"Gets", " ", "edge", " ", "in", " ", "alpha"}], "+", 
          RowBox[{"beta", " ", "direction"}]}], ",", " ", 
         RowBox[{"etc", "."}]}], " ", "*)"}], "\n", 
       RowBox[{"weights", "=", 
        RowBox[{"Join", "[", 
         RowBox[{"weights", ",", 
          RowBox[{"Edge", "[", 
           RowBox[{"nextweight", ",", "dim", ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "1"}], "}"}]}], "]"}]}], "]"}]}], ";", "\n", 
       RowBox[{"nextweight", "=", 
        RowBox[{"Last", "[", 
         RowBox[{"Keys", "[", "weights", "]"}], "]"}]}], ";", "\n", 
       RowBox[{"weights", "=", 
        RowBox[{"Join", "[", 
         RowBox[{"weights", ",", 
          RowBox[{"Edge", "[", 
           RowBox[{"nextweight", ",", "dim", ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1"}], "}"}]}], "]"}]}], "]"}]}], ";", "\n", 
       RowBox[{"nextweight", "=", 
        RowBox[{"Last", "[", 
         RowBox[{"Keys", "[", "weights", "]"}], "]"}]}], ";", "\n", 
       RowBox[{"weights", "=", 
        RowBox[{"Join", "[", 
         RowBox[{"weights", ",", 
          RowBox[{"Edge", "[", 
           RowBox[{"nextweight", ",", "dim", ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "0"}], "}"}]}], "]"}]}], "]"}]}], ";", "\n", 
       RowBox[{"nextweight", "=", 
        RowBox[{"Last", "[", 
         RowBox[{"Keys", "[", "weights", "]"}], "]"}]}], ";", "\n", 
       RowBox[{"weights", "=", 
        RowBox[{"Join", "[", 
         RowBox[{"weights", ",", 
          RowBox[{"Edge", "[", 
           RowBox[{"nextweight", ",", "dim", ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "1"}], "}"}]}], "]"}]}], "]"}]}], ";", "\n", 
       RowBox[{"nextweight", "=", 
        RowBox[{"Last", "[", 
         RowBox[{"Keys", "[", "weights", "]"}], "]"}]}], ";", "\n", 
       RowBox[{"weights", "=", 
        RowBox[{"Join", "[", 
         RowBox[{"weights", ",", 
          RowBox[{"Edge", "[", 
           RowBox[{"nextweight", ",", "dim", ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1"}], "}"}]}], "]"}]}], "]"}]}], ";", "\n", 
       "\n", 
       RowBox[{"Return", "[", "weights", "]"}], ";"}]}], "\n", "]"}]}], ";"}],
   "\n", "\n", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "Takes", " ", "extremal", " ", "weight", " ", "of", " ", "sl_", "2", " ", 
     "module", " ", "corresponding", " ", "to", " ", "root"}], ",", " ", 
    RowBox[{
    "gets", " ", "all", " ", "weights", " ", "from", " ", "that", " ", 
     "rep"}]}], " ", "*)"}]}], "\n", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"Edge", "[", 
     RowBox[{"weight_", ",", " ", "dim_", ",", "root_"}], "]"}], ":=", 
    RowBox[{"Module", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"n", ",", "cartanmatrix"}], "}"}], ",", "\n", 
      RowBox[{
       RowBox[{"n", "=", 
        RowBox[{"Dot", "[", 
         RowBox[{"weight", ",", "root"}], "]"}]}], ";", "\n", 
       RowBox[{"(*", " ", 
        RowBox[{
        "Used", " ", "to", " ", "change", " ", "basis", " ", "from", " ", 
         "simple", " ", "roots", " ", "to", " ", "fundamental", " ", 
         "dominant", " ", "weight"}], " ", "*)"}], "\n", 
       RowBox[{"cartanmatrix", "=", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"2", ",", 
            RowBox[{"-", "1"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"-", "1"}], ",", "2"}], "}"}]}], "}"}]}], ";", "\n", 
       RowBox[{"Return", "[", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"n", "<", "0"}], ",", "\n", 
          RowBox[{"Association", "[", 
           RowBox[{"Table", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"(", 
               RowBox[{"weight", "+", 
                RowBox[{"x", "*", 
                 RowBox[{"(", 
                  RowBox[{"cartanmatrix", ".", "root"}], ")"}]}]}], ")"}], "->",
               "dim"}], ",", 
             RowBox[{"{", 
              RowBox[{"x", ",", "1", ",", 
               RowBox[{"-", "n"}]}], "}"}]}], "]"}], "]"}], ",", "\n", 
          RowBox[{"Association", "[", 
           RowBox[{"Table", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"(", 
               RowBox[{"weight", "-", 
                RowBox[{"x", "*", 
                 RowBox[{"(", 
                  RowBox[{"cartanmatrix", ".", "root"}], ")"}]}]}], ")"}], "->",
               "dim"}], ",", 
             RowBox[{"{", 
              RowBox[{"x", ",", "1", ",", "n"}], "}"}]}], "]"}], "]"}]}], 
         "]"}], "\n", "]"}], ";"}]}], "\n", "]"}]}], ";"}], "\n", "\n", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Plots", " ", "a", " ", "given", " ", "collection", " ", "of", " ", 
    "weights", " ", "in", " ", "Euclidean", " ", "coordinates"}], " ", 
   "*)"}]}], "\n", 
 RowBox[{
  RowBox[{
   RowBox[{"PlotWeights", "[", "weights_", "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", "cobmatrix", "}"}], ",", "\n", 
     RowBox[{
      RowBox[{"cobmatrix", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"Sqrt", "[", "3", "]"}], "/", "2"}], ",", "0"}], "}"}], 
         ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"1", "/", "2"}], ",", "1"}], "}"}]}], "}"}]}], ";", "\n", 
      RowBox[{"Return", "[", "\n", 
       RowBox[{"(*", 
        RowBox[{"ListPlot", "[", 
         RowBox[{
          RowBox[{"Transpose", "[", 
           RowBox[{"cobmatrix", ".", 
            RowBox[{"Transpose", "[", 
             RowBox[{"Keys", "[", "weights", "]"}], "]"}]}], "]"}], ",", "\n", 
          RowBox[{
           RowBox[{
            RowBox[{"PlotStyle", "->", 
             RowBox[{"PointSize", "[", "#", "]"}]}], "&"}], "/@", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"Values", "[", "weights", "]"}], "*", "0.01"}], 
            ")"}]}]}], "]"}], "*)"}], "\n", 
       RowBox[{"BubbleChart", "[", 
        RowBox[{
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"Append", "[", 
            RowBox[{
             RowBox[{"cobmatrix", ".", "pt"}], ",", 
             RowBox[{"weights", "[", "pt", "]"}]}], "]"}], ",", 
           RowBox[{"{", 
            RowBox[{"pt", ",", 
             RowBox[{"Keys", "[", "weights", "]"}]}], "}"}]}], "]"}], ",", 
         " ", 
         RowBox[{"Frame", "->", "False"}], ",", 
         RowBox[{"Axes", "->", "True"}], ",", 
         RowBox[{"AxesOrigin", "->", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0"}], "}"}], "AspectRatio"}], "->", "1"}]}]}],
         "]"}], "\n", "]"}], ";"}]}], "\n", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"InvariantForm", "[", 
    RowBox[{"type_", ",", "rank_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", "matrix", "}"}], ",", "\[IndentingNewLine]", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"type", "\[Equal]", "A"}], ",", 
        RowBox[{"Return", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"(", 
             RowBox[{
              RowBox[{"Min", "[", 
               RowBox[{"i", ",", "j"}], "]"}], "*", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{"rank", "+", "1"}], ")"}], "-", 
                RowBox[{"Max", "[", 
                 RowBox[{"i", ",", "j"}], "]"}]}], ")"}]}], ")"}], "/", 
            RowBox[{"(", 
             RowBox[{"rank", "+", "1"}], ")"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i", ",", "1", ",", "rank"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"j", ",", "1", ",", "rank"}], "}"}]}], "]"}], "]"}]}], 
       "]"}], ";", "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"type", "\[Equal]", "B"}], ",", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"matrix", "=", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"Min", "[", 
             RowBox[{"i", ",", "j"}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"i", ",", "1", ",", "rank"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"j", ",", "1", ",", "rank"}], "}"}]}], "]"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"matrix", "[", 
           RowBox[{"[", "rank", "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"matrix", "[", 
            RowBox[{"[", "rank", "]"}], "]"}], "/", "2"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"matrix", "[", 
           RowBox[{"[", 
            RowBox[{"All", ",", "rank"}], "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"matrix", "[", 
            RowBox[{"[", 
             RowBox[{"All", ",", "rank"}], "]"}], "]"}], "/", "2"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{"Return", "[", "matrix", "]"}]}]}], "]"}], ";", 
      "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"type", "\[Equal]", "C"}], ",", 
        RowBox[{"Return", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"Min", "[", 
            RowBox[{"i", ",", "j"}], "]"}], ",", 
           RowBox[{"{", 
            RowBox[{"i", ",", "1", ",", "rank"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"j", ",", "1", ",", "rank"}], "}"}]}], "]"}], "]"}]}], 
       "]"}], ";", "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"type", "\[Equal]", "D"}], ",", 
        RowBox[{
         RowBox[{"matrix", "=", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"Min", "[", 
             RowBox[{"i", ",", "j"}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"i", ",", "1", ",", "rank"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"j", ",", "1", ",", "rank"}], "}"}]}], "]"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"matrix", "[", 
           RowBox[{"[", 
            RowBox[{"rank", "-", "1"}], "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"matrix", "[", 
            RowBox[{"[", 
             RowBox[{"rank", "-", "1"}], "]"}], "]"}], "/", "2"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"matrix", "[", 
           RowBox[{"[", "rank", "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"matrix", "[", 
            RowBox[{"[", "rank", "]"}], "]"}], "/", "2"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"matrix", "[", 
           RowBox[{"[", 
            RowBox[{"All", ",", 
             RowBox[{"rank", "-", "1"}]}], "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"matrix", "[", 
            RowBox[{"[", 
             RowBox[{"All", ",", 
              RowBox[{"rank", "-", "1"}]}], "]"}], "]"}], "/", "2"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"matrix", "[", 
           RowBox[{"[", 
            RowBox[{"All", ",", "rank"}], "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"matrix", "[", 
            RowBox[{"[", 
             RowBox[{"All", ",", "rank"}], "]"}], "]"}], "/", "2"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"matrix", "[", 
           RowBox[{"[", 
            RowBox[{
             RowBox[{"rank", "-", "1"}], ",", 
             RowBox[{"rank", "-", "1"}]}], "]"}], "]"}], "=", 
          RowBox[{"rank", "/", "4"}]}], ";", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"matrix", "[", 
           RowBox[{"[", 
            RowBox[{"rank", ",", "rank"}], "]"}], "]"}], "=", 
          RowBox[{"rank", "/", "4"}]}], ";", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"matrix", "[", 
           RowBox[{"[", 
            RowBox[{
             RowBox[{"rank", "-", "1"}], ",", "rank"}], "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"rank", "-", "2"}], ")"}], "/", "4"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"matrix", "[", 
           RowBox[{"[", 
            RowBox[{"rank", ",", 
             RowBox[{"rank", "-", "1"}]}], "]"}], "]"}], "=", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"rank", "-", "2"}], ")"}], "/", "4"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{"Return", "[", "matrix", "]"}]}]}], "]"}], ";"}]}], 
    "\[IndentingNewLine]", "]"}]}], ";"}]}], "Input",
 CellChangeTimes->{
  3.7069963045317106`*^9, {3.7069964216319723`*^9, 3.706996641437299*^9}, {
   3.706997413141328*^9, 3.706997432618388*^9}, {3.706997476722333*^9, 
   3.7069975227090006`*^9}, {3.7069990052384253`*^9, 3.706999154806037*^9}, {
   3.7069993761722703`*^9, 3.706999386490945*^9}, {3.7069995178378596`*^9, 
   3.7069995421439314`*^9}, {3.7069998218957453`*^9, 
   3.7069998617094245`*^9}, {3.706999894647874*^9, 3.7070001076417246`*^9}, {
   3.707000142236249*^9, 3.707000145882991*^9}, {3.7070002250442095`*^9, 
   3.7070002350011215`*^9}, {3.7070002768169003`*^9, 
   3.7070003131359835`*^9}, {3.707000415219497*^9, 3.707000515406006*^9}, {
   3.707002495620059*^9, 3.7070025465444813`*^9}, {3.707003101315734*^9, 
   3.707003148319113*^9}, {3.707003180576088*^9, 3.7070031833177705`*^9}, {
   3.707003359181158*^9, 3.707003368104472*^9}, {3.707003431047845*^9, 
   3.7070036411189556`*^9}, {3.707003690145973*^9, 3.7070037319726763`*^9}, {
   3.707003929012559*^9, 3.707003929465646*^9}}]
},
WindowSize->{770, 513},
WindowMargins->{{196, Automatic}, {0, Automatic}},
FrontEndVersion->"11.0 for Microsoft Windows (64-bit) (September 21, 2016)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[558, 20, 33145, 842, 2729, "Input"]
}
]
*)

(* End of internal cache information *)

