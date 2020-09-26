# DSP EC550 Lab Experiment 1

<div align="center">
    <h2>Verification of Nyquist's Sampling Theorem</h2>
</div><hr>


<div align="center">
    <h2>Question</h2>
</div>
<hr>

- Write a MATLAB code to illustrate the Nyquist sampling theorem. The program should illustrate the effects the sampling the signal at 
    - Exactly the folding frequency
    - Frequency less than the folding frequency
    - Frequency greater than the folding frequency

    Plot the magnitude spectrum for all the above said cases 
- Write a MATLAB code to compute the DTFT and DFT of a sequence x (n). Also plot the magnitude spectrum of both DTFT and DFT and provide the inference on the basis of results obtained. Further compute the IDFT.

***
<div align="center">
    <h2>Solution</h2>
</div><hr>

### Part 1

In order to represent an analog signal x(t) by a discrete-time signal x(n) accurately,  the analog signal can be exactly reconstructed back from the discrete-time signal, the sampling frequency fs must be at least twice the maximum frequency component (fm) of the original analog signal. Thus we have, 
 - fs ≥ 2 * fm

The minimum sampling rate is called the Nyquist rate and the above Sampling Theorem is called the Shannon's Sampling Theorem.

Under Sampling 
- fs ≤ 2 * fm

Perfect Sampling
 - fs = 2 * fm

 Over Sampling
 - fs >> 2 * fm

Output of v2Sampling.m with an input of 200 Hz. <a href="./Part 1/v2sampling.m">Download v2sampling.m</a>

<div align="center">
<img src="./Part 1/Sampling.svg">
</div>

 ### Part 2

Calculating DTFT, DFT and IDFT
- Entire code in part 2 should be available for working with any of the above.

<div align="center">
    <img src="./Part 2/dft_dtft_from time.svg">
    DTFT and DFT for a signal x(n) = [1 3 5 7]
</div>
<div align="center">
    <img src="./Part 2/idft from freq.svg">
    IDFT from a signal X(K) = [16, -4+4i, -4, -4-4i]
</div>
