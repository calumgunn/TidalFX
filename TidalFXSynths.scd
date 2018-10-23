(
var numChannels =  ~dirt.numChannels;

/****************************
        WAVELOSS
*****************************/

~dirt.addModule('waveloss', { |dirtEvent|
	dirtEvent.sendSynth('waveloss' ++ ~dirt.numChannels,
		[
			drop: ~drop,
			sustain: ~sustain,
			out: ~out
		]
	)
}, { ~drop.notNil });

SynthDef("waveloss" ++ numChannels, { |out, drop = 1, sustain|
	var sig;

	sig = In.ar(out, numChannels);
  sig = WaveLoss.ar(sig, drop, outof: 100, mode: 2);
	ReplaceOut.ar(out, sig)
}).add;
)

