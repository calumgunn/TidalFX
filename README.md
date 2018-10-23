# TidalFX
A haskell package adding weirder effects to Tidal from non-standard UGens.

Use:
1. Download this repo from github
2. Install the package on your system (using your terminal, cd into the `Cabal-Package` folder and type `cabal install`)
3. In Tidal, evaluate the line `import Sound.Tidal.TidalFX`
4. Evaluate TidalFXSynths.scd in Supercollider

That's it!

Spectral thanks to Mads Kjeldgaard for writing [SpectralTricks](https://github.com/madskjeldgaard/SpectralTricks) - the format of this repo is largely copied from that.

## The parameters:

#### Waveloss
`# waveloss n`

Waveset-based sample dropping.

Accepts an integer controlling how many samples out of 100 are dropped. Requires the `WaveLoss` UGen from sc3-synths.

#### Squiz
`# squiz n`

A wave squeezing pitch-shifter.

Accepts an integer denoting 'pitchratio'. A value of 1 plays audio normally, while a value of 2 will raise by one octave, and so on.
