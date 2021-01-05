class ApplicationController < ActionController::Base

    private
    # require_loginが発動したとき、警告する
    def not_authenticated
      redirect_to login_path, alert: "ログインが必要です"
    end
end
