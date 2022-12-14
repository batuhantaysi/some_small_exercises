### PRNG Script between values 1 and 10 written as a Bash script

## Build Instructions

Script is written in Bash and runs via /bin/bash. The execution privilege is needed to be given to the file.

> chmod +x ./prng.sh

## Usage

> ./prng.sh [OPTIONAL] -i param -u param
> -l : lower bound
> -u : upper bound
> Bounds are optional, script is going to generate values between 1 and 10 as default
> If a bound value is given as a parameter, the other bound must be given too.


## Description

Spoiler: GNU shuf works much better than this script. It it recommended to use shuf.
 
This script generates a permutation in range of numbers, between 1 and 10 by default.

A seed value is going to be taken with the help of $RANDOM variable in Bash. Modulus operation will be applied to that value and the random number between desired range is going to be generated. If the value that generated is never appeared before, It will marked as generated and will be given to the user.

Test cases:

> ./prng.sh 

> ./prng.sh -l 1 -u 10

> ./prng.sh -l 5 -u 25

> ./prng.sh -l 0 -u 32767 #If you have spare time

## Known limitations / Bugs

- As the range grows, the probability of an unfound value is generated gets lower. It can cause some problems like CPU overload. Also, theoretically, there is a possibility that the value is never going to be generated and the script will not end.

- The upper bound can be 32767 at maximum since RANDOM variable generates signed 16-bit integer values.
