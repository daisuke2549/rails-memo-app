class Api::MemosController < ApplicationController
    def index
        @memos = Memo.order('created_at DESC')
    end
    def create
        @memo = Memo.new(memo_params)
        if @memo.save
            render :show, status: :created
        else
            render json: @memo.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @memo =  current_account.posts.find(params[:id])
        @memo.destroy!
        redirect_to posts_path(@post), notice: '削除に成功しました'
    end

    private
      def memo_params
        params.permit(:title, :description)
      end
end
