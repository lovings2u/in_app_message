class MessageController < ApplicationController
  before_action :authenticate_user!
  before_action :check_receiver, only: [:new]
  before_action :set_message, only: [:destroy]
  def index
    if params[:act] == 'send'
      @messages = current_user.send_conversations
    elsif params[:act] == 'receive'
      @messages = current_user.receipt_conversations
    else
      redirect_to root_path, notice: '잘못된 접근입니다.'
    end
  end

  def new
    @message = Conversation.new
    @recipient = User.find_by_email(params[:user])
  end


  def deliver
    recipient = User.find_by_email(params[:recipient])
    message = current_user.send_conversations.build(recipient_id: recipient.id, message: params[:message])

    if message.save
      redirect_to messages_path(:send), notice: '메시지가 발송되었습니다.'
    else
      redirect_to new_message_path, notice: '메시지 발송에 실패했습니다. 다시 시도해주세요.'
    end
  end


  def destroy
    @message.destroy
    puts request
    redirect_to :back, info: '메시지가 삭제되었습니다.'
  end

  private

  def set_message
    @message = Conversation.find(params[:id])
  end

  def set_params
    params.fetch(:conversation, {}).require(:recipient_id, :message)
  end

  def check_receiver
    redirect_to :back, notice: '자신에게 메시지를 쓸 수 없습니다.' if current_user.email == params[:user]
  end
end
