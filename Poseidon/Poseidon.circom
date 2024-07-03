pragma circom 2.1.4;

include "./poseidon.circom";

// Go through the circomlib library and import the poseidon hashing template using node_modules
// Input 4 variables,namely,'a','b','c','d' , and output variable 'out' .
// Now , hash all the 4 inputs using poseidon and output it . 
template poseidon() {
   signal input a;
   signal input b;
   signal input c;
   signal input d;

   signal output out;

   component poseidonHash = Poseidon(4);
   poseidonHash.inputs[0] <== a;
   poseidonHash.inputs[1] <== b;
   poseidonHash.inputs[2] <== c;
   poseidonHash.inputs[3] <== d;

   out <== poseidonHash.out;
}

component main = poseidon();