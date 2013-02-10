#coding: utf-8
class CardsController < ApplicationController
  def index
		@cards = Card.all

		respond_to do |format|
			format.html
			format.json{render json: @cards }
		end

  end

  def show
		@card = Card.find(params[:card_id])
		respond_to do |format|
			format.html
			format.json { render json: @card }
		end
  end
	
	def question
		@sessionID  = request.session_options[:id]
	  @win_count  = session[:win]  = session[:win].blank?  ? 0 : session[:win]
		@loss_count = session[:loss] = session[:loss].blank? ? 0 : session[:loss]
		
		if session[:is_picked].blank? then
			session[:is_picked] = "0,0,0,0,0,0,0,0,0,0,0"
		end
		
		@is_picked_list = session[:is_picked].split(",") 

		@cards = Card.all
		
		if params[:card_id] == '000' then
			#ランダムでカードを選択
			randNum = rand(10) + 1
			while session[:is_picked].split(",")[randNum] == "1" do
				randNum = rand(10) + 1
			end

			@draw_card = Card.find_by_card_id('%03d' % randNum)
		else
			#指定されたカードを選択
			@draw_card = Card.find_by_card_id(params[:card_id])
	
		end
		#インスタンス変数を使って選択されているカードをテンプレートに渡す
		@draw_card_image = 'hyakunin-tori/tori-' << @draw_card.card_id << '.png'
		respond_to do |format|
			format.html
			format.json { render json: @draw_card }
		end
		@is_picked = session[:is_picked]
	end

	def check
		#リンクから上の句の歌のIDと選択された歌のIDを取得
		draw_id = params[:draw]
		ans_id = params[:ans]
		
		#インスタンス変数を使ってそれぞれのカードをテンプレートに渡す
		@draw_card = Card.find(draw_id)
		@card = Card.find(ans_id)
	
		#正誤を判定し、結果をインスタンス変数でテンプレートに渡す
		@is_right_card
		if draw_id == ans_id then
			@is_right_card = true
			session[:win] = session[:win] + 1
			
			is_picked_list = session[:is_picked].split(",")
			is_picked_list[ans_id.to_i] = "1"
			session[:is_picked] = is_picked_list.join(",")
		else
			@is_right_card = false
			session[:loss] = session[:loss] + 1
		end

		#取り札がなくなったか確認
		@is_finish = true
		for i in 1..11 do
			if session[:is_picked].split(",")[i] == "0" then
				@is_finish = false
			end
		end
		
		if @is_finish == true then
			session[:is_picked] = "0,0,0,0,0,0,0,0,0,0,0"
			session[:win] = 0
			session[:loss] = 0
		end

		@win_count = session[:win]
		@loss_count = session[:loss]
		
		
		@pins = @card.to_gmaps4rails
	end

end
