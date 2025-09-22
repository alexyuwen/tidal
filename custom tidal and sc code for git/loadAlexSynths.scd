// Load synths
// ~/Library/Application Support/SuperCollider/downloaded-quarks/SuperDirt/alex/loadAlexSynths.scd

"Loading synths...\n\n".postln;

// alexSynths is a folder in the same folder as this file, loadAlexSynths.  It contains SynthDefs definitions: SynthDef(...).add
PathName.new(PathName(thisProcess.nowExecutingPath).parentPath ++ "alexSynths").filesDo({
	arg file;

	if(
		file.extension == "scd"
	){
		file.fullPath.postln;
		file.fullPath.load;
	}

});

"\n\n".postln;