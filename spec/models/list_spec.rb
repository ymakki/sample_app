# frozen_string_literal: true

require 'rails_helper'

describe '実際に保存してみる' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:list)).to be_valid
    # ↑ FactoryBot.build(:book)で作成したBookモデルのインスタンスをexpectに渡して、be_validで有効かを判定しています。
    # ここでexpectの期待値でFactoryBot.build(:book)として使用されています。
    # FactoryBot.build(:モデル名)で対象モデルのインスタンスを作成します。
    # FactoryBotを使用すればit部などにいちいちインスタンスをnewして値を代入する必要性がなくなり、簡潔に記述することが可能です。
  end
end