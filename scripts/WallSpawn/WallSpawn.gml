function WallSpawn(tileSize){
	var layerId = layer_tilemap_get_id("Tiles");
	var platformId = layer_tilemap_get_id("Platforms");

	function SpawnWall(tileObject, directionTile){
		if(directionTile == 0 || directionTile == -1 ){
			instance_create_layer(tileObject[0], tileObject[1], "Wall", oWall);
			return;
		}
	}

	//Gets Tiles
	for (var _x=0; _x<room_width; _x+=tileSize) { 
		for (var _y=0; _y<room_height; _y+=tileSize) { 
			var tile = tilemap_get_at_pixel(layerId, _x, _y);
			var platform = tilemap_get_at_pixel(platformId, _x, _y);
			var position = [_x, _y];
			
			if(tile != 0){
				var bottomTile = tilemap_get_at_pixel(layerId, _x, _y+tileSize);
				SpawnWall(position, bottomTile);
				var topTile = tilemap_get_at_pixel(layerId, _x, _y-tileSize);
				SpawnWall(position, topTile);
				var leftTile = tilemap_get_at_pixel(layerId, _x-tileSize, _y);
				SpawnWall(position, leftTile);
				var rightTile = tilemap_get_at_pixel(layerId, _x+tileSize, _y);
				SpawnWall(position, rightTile);
			}

			if(platform != 0){
				instance_create_layer(position[0], position[1], "PlatformWall", oPlatformWall);
			}
		}
	}
}