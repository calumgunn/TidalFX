(
var numChannels =  ~dirt.numChannels;

/****************************
        WAVELOSS
*****************************/

~dirt.addModule('waveloss', { |dirtEvent|
	dirtEvent.sendSynth('waveloss' ++ ~dirt.numChannels,
		[
			drop: ~waveloss,
			out: ~out
		]
	)
}, { true });

SynthDef("waveloss" ++ numChannels, { |out, drop = 1|
	var sig;

	sig = In.ar(out, numChannels);
  sig = WaveLoss.ar(sig, drop, outof: 100, mode: 2);
	ReplaceOut.ar(out, sig)
}).add;

/****************************
        SQUIZ
*****************************/

~dirt.addModule('squiz', { |dirtEvent|
	dirtEvent.sendSynth('squiz' ++ ~dirt.numChannels,
		[
			pitchratio: ~squiz,
			out: ~out
		]
	)
}, { true });

SynthDef("squiz" ++ numChannels, { |out, pitchratio = 1|
	var sig;
	sig = In.ar(out, numChannels);
  sig = Squiz.ar(sig, pitchratio);
	ReplaceOut.ar(out, sig)
}).add;
)

