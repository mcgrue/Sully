// ================================================================================================
//  wrapMap() Function
//   by Shamus "Kildorf" Peveril -- May 04/2005
// ------------------------------------------------------------------------------------------------
//  WrapMap() allows you to have a map that "wraps"... you can walk forever in any direction,
// 	and the map will repeat seamlessly.
//
//  Use renderHook("wrapMap") or just call it from a hookRender()ed function while you're in a map
//  that you want to wrap. You'll have to pass in the entity number of whatever entity is
//  currently player controlled, because there's no getPlayer()! :D
//
//
//  The map has to be built correctly or it will look like ass when it wraps. Basically, add
//  (X_resolution/16) + 2 tiles to the width of the map, and (Y_resolution/16) + 2 tiles to the
//  height. For example, in 320x240, add 22 and 17 tiles, respectively.
//
//  Build your map as normal inside the "normal" area of the map... ie, the size the map would be
//  without the added buffers. Once the map is made, grab the map with the copy command and copy
//  it into the blank space, lining up the right hand side of the map with the left of the paste.
//  Then, grab that and paste it down into the border at the bottom. You'll have buffers on the
//  right and bottom of the map that allow wrapMap() to wrap seamlessly.
//
//  Hopefully the explanation actually makes sense. If not, track me down:
//     e-mail  -- speveril@northknight.com
//     MSN     -- kildorf@isn.net
//  and I'm Kildorf on the VERGE boards.
//
//  This is, of course, assuming that anyone other than McGrue ever sees this! :D
//                                                                                       - Kildorf
//
//  Known glitchy things:
//    When the entity is wrapped the animation sometimes stutters
// ------------------------------------------------------------------------------------------------


void wrapMap(int e) {
	int wrapmapW = curmap.w*16;
	int wrapmapH = curmap.h*16;
	int wrapxbuffer = (imageWidth(screen)/2)+16;
	int wrapybuffer = (imageHeight(screen)/2)+16;

	if(entity.y[e] < wrapybuffer) entity.y[e] += (wrapmapH - (2*wrapybuffer));
	else if(entity.y[e] > (wrapmapH-wrapybuffer)) entity.y[e] -= (wrapmapH - (2*wrapybuffer));
	if(entity.x[e] < wrapxbuffer) entity.x[e] += (wrapmapW - (2*wrapxbuffer));
	else if(entity.x[e] > (wrapmapW-wrapxbuffer)) entity.x[e] -= (wrapmapW - (2*wrapxbuffer));
}

// ================================================================================================