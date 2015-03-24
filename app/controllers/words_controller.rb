class WordsController < ApplicationController
  def fetch
    klass = word_params[:part_of_speech].capitalize.constantize

    render json: {
      partOfSpeech: word_params[:part_of_speech],
      words: klass.random( word_params )
    }
  end

  private

  def word_params
    @word_param ||= params.require(:word)
                          .permit(:part_of_speech, :count, :starting_letter)
  end
end
