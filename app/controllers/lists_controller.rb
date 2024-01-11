class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    # １. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      flash.now[:alert] = "投稿に失敗しました。" #キーをalertに変更
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    # 「findメソッド」は主キー(id)を指定して、見つかった1レコードを返す
      # 1.find()の()内に記述できる数値（id）のみ
      # 2.idは主キーなので、1レコードのみ取得
      # 3.検索に該当するデータがなかった場合、ActiveRecord::RecordNotFoundを返す

      # id=1のみを取得したい場合
      # List.find(1)

      # URLの:idを取得したい場合
      # List.find(params[:id])

    # 「find_byメソッド」は主キー(id)以外のカラムを指定しても、見つかった1レコードを返せる
      # 1.find_by()の()内に記述できるのは、数値（id）だけでなく、文字（id以外のカラム）も可能
      # 2.id以外のカラムも指定できるので、複数のレコードが見つかる場合もありますが、その時は、一番最初に見つかったレコード1件を取得
      # 3.検索に該当するデータがなかった場合、nilを返す

      # titleカラムに「ruby」で投稿されたレコードを取得したい場合
      # List.find_by(title: "ruby")

      # titleカラムに「ruby」、bodyカラムに「rails」で投稿されたレコードを取得したい場合
      # List.find_by(title: "ruby",body: "rails")

    # 「whereメソッド」は主キー(id)以外のカラムも指定できる、且つ、複数のレコードも返せる
      # 1.where()の()内に記述できるのは、数値（id）だけでなく、文字（id以外のカラム）も可能
      # 2.該当する複数のレコードを取得
      # 3.検索に該当するデータがなかった場合、空の配列を返す

      # titleカラムに「ruby」で投稿された全レコードを取得したい場合
      # List.where(title: "ruby")

      # titleカラムに「ruby」、bodyカラムに「rails」で投稿された全レコードを取得したい場合
      # List.where(title: "ruby",body: "rails")

     @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to lists_path  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end