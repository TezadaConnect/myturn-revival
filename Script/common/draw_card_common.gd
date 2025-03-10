class_name DrawCardCommon

func drawCardSprite(cname, cmana, cdesc, cimage, ccolor) -> Sprite2D:
	# Designing name label
	var nameLabel = Label.new(); 
	nameLabel.set_text(cname);
	nameLabel.set_position(Vector2(-51, -115));
	nameLabel.add_theme_font_size_override("font_size", 20);
	
	# Designing mana label
	var manaLabel = Label.new(); 
	manaLabel.set_text(str(cmana));
	manaLabel.set_position(Vector2(-83, -122));
	manaLabel.add_theme_font_size_override("font_size", 30);

	# Designing desc label
	var descLabel = Label.new(); 
	descLabel.set_text(cdesc);
	descLabel.vertical_alignment = VERTICAL_ALIGNMENT_CENTER;
	descLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER;
	descLabel.add_theme_font_size_override("font_size", 12);
	descLabel.set_position(self._getPositionBaseOnSize(descLabel.get_minimum_size()));
	
	# Designing card image
	var textureDisplay = TextureRect.new();
	var img = ImageTexture.create_from_image(Image.load_from_file(cimage))
	img.set_size_override(Vector2(194, 106))
	textureDisplay.set_texture(img);
	textureDisplay.set_position(Vector2(-97, -74));
	
	# Designing card sprite
	var card = Sprite2D.new();
	self._findCardColor(ccolor, card)
	card.add_child(manaLabel);
	card.add_child(nameLabel);
	card.add_child(descLabel);
	card.add_child(textureDisplay);
	
	return card;

func _findCardColor(color, sprite):
	var colorEnum = EnumContainerHelper.CardColorsEnum
	if(color == colorEnum.RED):
		sprite.set_texture(load("res://assets/img/card-skins/red_skin.png"));
	if(color == colorEnum.GREEN):
		sprite.set_texture(load("res://assets/img/card-skins/green_skin.png"));
	if(color == colorEnum.BLUE):
		sprite.set_texture(load("res://assets/img/card-skins/blue_skin.png"));
	if(color == colorEnum.YELLOW):
		sprite.set_texture(load("res://assets/img/card-skins/yello_skin.png"));
	if(color == colorEnum.PURPLE):
		sprite.set_texture(load("res://assets/img/card-skins/purple_skin.png"));

func _getPositionBaseOnSize(size):	
	var xAxis = size.x/2;
	var yAxis = size.y/2;
	if(xAxis > 70):
		return Vector2(-xAxis + 24, yAxis + 32);
	if(xAxis > 100):
		return Vector2(0, 0);
	return Vector2(-xAxis + 19, yAxis + 32);
	
