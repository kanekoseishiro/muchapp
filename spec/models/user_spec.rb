require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録がうまくいく' do
    it "ニックネーム、メールアドレス、パスワード、パスワード確認、年齢、性別、生年月日、都道府県、電話番号がある" do
      expect(@user).to be_valid
    end
    it "ニックネームが20文字以下である" do
      @user.nickname = "aaaaaaaaaaaaaaaaaaaa"
      expect(@user).to be_valid
    end
    it "パスワードは6文字以上で半角英数字混合であること" do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa111"
      expect(@user).to be_valid
    end
  end

  describe 'ユーザー新規登録がうまくいかない' do
    it "ニックネームが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "ニックネームが21文字以上だと登録できない" do
      @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 20 characters)")
    end
    it "メールアドレスが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したメールアドレスが存在する場合は登録できない" do
      @user.save
      anothor_user =FactoryBot.build(:user)
      anothor_user.email = @user.email
      anothor_user.valid?
      expect(anothor_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは@がないと登録できない" do
      @user.email = 'testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが5文字以下だと登録できない" do
      @user.password = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードが英数混合でないと登録できない" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが存在してもパスワード確認用が空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "年齢が空だと登録できない" do
      @user.age = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Age can't be blank")
    end
    it "年齢は数字以外では登録できない" do
      @user.age = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Age is invalid")
    end
    it "性別が空だと登録できない" do
      @user.gender = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Gender can't be blank")
    end
    it "性別が「---」だと登録できない" do
      @user.gender = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Gender must be other than 1")
    end
    it "誕生日が空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "都道府県が存在しない" do
      @user.prefecture = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "都道府県が「---」で存在する" do
      @user.prefecture = "1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "電話番号が存在しない" do
      @user.phone_number = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号が11文字以上で存在する" do
      @user.phone_number = "000011110000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end
