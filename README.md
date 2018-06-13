# -EYE-DIAGRAM--PAM

This project is Matlab Simulator that generates the eye diagrams of binary and 4-level PAM signaling, employing various pulse shapes.
The objective of the project is to use the eye diagram to test the vulnerability of various signaling schemes to ISI and AWGN.

## Project Parts:
### 1. Noise-Free Systems:
Eye diagrams for a DCS that uses polar NRZ, polar RZ, ideal Nyquist pulse and raised-cosine pulse shapes in binary and 4-level PAM.

#### How to use
The function allows the user to enter the following as inputs:
• Pulse shape type (NRZ, RZ, Ideal Nyquist Pulse, Raised-Cosine Pule)
• Number of PAM levels (Binary, 4-level)
• Duration of Eye Diagram (Ts, 2Ts)

### 2. Noisy Systems
Eye diagrams for each DCS in Part 1, assuming that the system is subject to AWGN ∼ N (0; N/2)
### How to use
The function allows the user to enter the following as inputs:
• The value of N

### 3.Error Rate Calculation
For the case of a DCS system using raised-cosine pulse shape and binary PAM signaling, the BER is found as a function of the SNR.

## Author

* **Ahmed Wael** - [Github](https://github.com/ahmedwael19)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
