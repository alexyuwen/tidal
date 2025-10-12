// You must specify a releaseNode in order for loopNode to have any effect. The loop node is the initial node of the loop and is never repeated. Upon reaching the release node, the envelope will transition back to the node that follows the loop node, over that node's transition time. The envelope will loop until the EnvGen's gate closes, at which point the envelope will move from its current position to the node that follows releaseNode, over that node's transition time, and proceed through any remaining nodes.

// However, it seems that the loopNode does not work.  Instead, use the gate argument.

(

SynthDef(\scTemplate, {
	arg gate=1, out=0, sustain=1, freq=440, speed=1, begin=0, end=1, pan=0, accelerate, offset;
	var amp, tone, env, volume, outAudio;

	// var line = Line.ar(begin,end,sustain,doneAction: Done.freeSelf);
	amp = 0.5;
	// env = Env.perc(0.01, 1.0);
	env = Env.adsr(0, 0, sustain, 0.1).kr(gate: gate, doneAction: 2);
	env = 1
	tone = Pulse.ar(freq); // To avoid clicks, try using #legato 0.99 in TidalCycles
	outAudio = tone * env * amp;

	OffsetOut.ar(out, DirtPan.ar(outAudio, ~dirt.numChannels, pan));
}).add;

)





