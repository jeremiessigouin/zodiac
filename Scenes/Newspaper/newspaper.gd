extends Node2D

@onready var article_image = $DisplayedNewspaper/ArticleImage
@onready var body_text_label = $DisplayedNewspaper/BodyText
@onready var headline_label = $DisplayedNewspaper/HeadlineLabel

var current_article_selection

signal back_to_hub

func _ready():
	pass


func init_data(data: Dictionary):
	if data.has("article"):
		set_article_data(data["article"])

func set_article_data(article: Dictionary):
	headline_label.text = article.get("headline", "")
	body_text_label.text = article.get("body", "")
	var image_path = article.get("image_path", "")
	if image_path != "":
		article_image.texture = load(image_path)


func _on_stephany_romy_pressed():
	var article_id = "stephany_romy_murder"
	var article = NewspaperArticleData.ARTICLES.get(article_id)
	set_article_data(article)

func _on_body_ditch_pressed():
	var article_id = "body_ditch"
	var article = NewspaperArticleData.ARTICLES.get(article_id)
	set_article_data(article)


func _on_back_button_pressed():
	emit_signal("back_to_hub")


func _on_1970_pressed():
	if current_article_selection:
		current_article_selection.hide()
	current_article_selection = $ArticleSelection1970
	current_article_selection.show()

func _on_1971_pressed():
	if current_article_selection:
		current_article_selection.hide()
	current_article_selection = $ArticleSelection1971
	current_article_selection.show()


func _on_preteen_molested_pressed():
	var article_id = "preteen_molested"
	var article = NewspaperArticleData.ARTICLES.get(article_id)
	set_article_data(article)
