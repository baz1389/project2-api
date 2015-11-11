class WordsController < OpenReadController

  # def index
  #   if params[:word] then
  #     @word = Word.where(word: params[:word])
  #       elsif params[:name] then
  #         @word = Word.where(name: params[:name])
  #       else
  #         @word = Word.all
  #       end
  #     end
  #   end
  #   render json: @words
  # end

  def index
    if current_user
      @words = current_user.words
    else
      @words = Word.all
    end

    render json: @words
  end

  def show
    render json: Word.find(params[:id])
  end

  def create
    word = Word.create(word_params)
    if word.save
      render json: word, status: :created
    else
      render json: word.errors, status: :unprocessable_entity
    end
  end

  def update
    word = Word.find(params[:id])
    if word.update_attributes(word_params)
      render json: word, status: :update
    else
      render json: word.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    head :ok
  end

  private

  def word_params
    params.require(:word).permit([:name, :definition, :sample_sentence, :user_id])
  end

end
