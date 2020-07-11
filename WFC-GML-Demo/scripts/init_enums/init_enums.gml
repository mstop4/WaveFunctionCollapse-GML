enum SYMMETRY {
	X,
	T,
	I,
	L,
	Z,
	R,
	M,
	E,
	MAX
}

enum SIDE {
	TOP,
	LEFT,
	BOTTOM,
	RIGHT,
	MAX
}

enum CELL_STATE {
	IDLE,
	IN_STACK,
	COLLAPSED,
	TILED,
	MAX
}

enum WFC_STATE {
	IDLE,
	BEGIN_STEP,
	PROPAGATION,
	END_STEP,
	MAX
}

enum EDITOR_SIDE_MODE {
	NONE,
	EDGE_IDS,
	NEIGHBOURS,
	MAX
}

enum EDITOR_TILE_MODE {
	RAW,
	FINAL,
	MAX
}