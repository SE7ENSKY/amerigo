$ ->
	$block = $(".gallery")
	return unless $block.length
	$list = $block.find('.gallery__list')

	$list.fotorama
		width: '100%'
		height: '100%'
		fit: 'cover'
		navposition: 'bottom'
		loop: true