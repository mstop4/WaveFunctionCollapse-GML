for (var i=0; i<2; i++) {
	for (var j=0; j<2; j++) {
		for (var k=0; k<2; k++) {
			var _x = ((k + j * 2) * 2 + 1) * 32;
			var _y = (i * 2 + 1) * 32;
			
			draw_text(_x, _y, string(k + j*2 + i*4));
		}
	}
}