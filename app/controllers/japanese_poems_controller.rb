class JapanesePoemsController < ApplicationController
  def index
  end

  def show
  end

  def play_game

		if get_remining_poems_id == nil then
			reset_game
		end

		remining_poems_id = get_remining_poems_id

		@remining_poems = JapanesePoem.find(remining_poems_id) 

		if params[:id] != '0' then
			@subject_poem = JapanesePoem.find(params[:id])
		else
			@subject_poem = JapanesePoem.select_random_poem(remining_poems_id)
		end 
		
	end

	def check_answer

		@subject_poem = JapanesePoem.find(params[:subject_poem])
		@picked_poem = JapanesePoem.find(params[:picked_poem])
		
		@is_match = @subject_poem.match?(@picked_poem)
		
		if @is_match then
			save(@subject_poem.id, 'correct')
		else
			save(@subject_poem.id, 'wrong')
		end

		@win_count = get_correct_id.length 
		@loss_count = get_wrong_id.length

		@pins = @picked_poem.to_gmaps4rails
	end



	#sessionの操作
	def reset_game
		session[:correct] = "0"
		session[:wrong] = "0"
		session[:remined] = "1,2,3,4,5,6,7,8,9,10"
	end


	def save(poem_id, result)

		if result == "correct" then
			session[:correct] = session[:correct].to_s << "," << poem_id	
			remined = get_remining_poems_id 
			remined.reject!{|id| id == poem_id.to_s}
			session[:remined] = remined.join(",")

		elsif result == "wrong" then
			session[:wrong] = session[:wrong].to_s << "," << poem_id
		end

	end
	
	def get_remining_poems_id
		session[:remined].blank? ? nil : session[:remined].split(",")
	end

	def get_correct_id
#		binding.pry
		session[:correct].blank? ? [] : session[:correct].split(",")
		
	end
	
	def get_wrong_id
		session[:wrong].blank? ? [] : session[:wrong].split(",")
	end

end

