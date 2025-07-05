extends Node2D

@onready var article_image = $DisplayedNewspaper/ArticleImage
@onready var body_text_label = $DisplayedNewspaper/BodyText
@onready var headline_label = $DisplayedNewspaper/HeadlineLabel

@onready  var article_selection = $ArticleSelection

signal back_to_hub

var articles_by_year = {
	'1970': ['stephany_romy_murder', 'body_ditch'],
	'1971': ['preteen_molested'],
	
	'1976': ['Lotus Killer Arrested'],
	'1977': ['body_ditch']
	
}

func _ready():
	for button in $YearSelection.get_children():
		button.pressed.connect(_on_year_selected.bind(button.text))
	$DisplayedNewspaper/Background.hide()

func init_data(data: Dictionary):
	if data.has("article"):
		set_article_data(data["article"])

func set_article_data(article: Dictionary):
	headline_label.text = article.get("headline", "")
	body_text_label.text = article.get("body", "")
	var image_path = article.get("image_path", "")
	if image_path != "":
		article_image.texture = load(image_path)


func _on_back_button_pressed():
	emit_signal("back_to_hub")


func _on_year_selected(year: String):
	for child in article_selection.get_children():
		child.queue_free()
	for article_id in articles_by_year.get(year, []):
		var article_info = NewspaperArticleData.ARTICLES.get(article_id)
		if article_info:
			var article_button = Button.new()
			article_button.text = article_id
			article_button.pressed.connect(_on_article_selected.bind(article_id))
			article_selection.add_child(article_button)

func _on_article_selected(article_id: String):
	var article = NewspaperArticleData.ARTICLES.get(article_id)
	$DisplayedNewspaper/Background.show()
	headline_label.text = article.headline
	body_text_label.text = article.body
	article_image.texture = load(article.image_path)
