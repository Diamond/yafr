require 'spec_helper'

describe User do
  describe "When creating a new user" do
    context "with valid data" do
      subject (:user) { FactoryGirl.build(:user, email: "someguy@test.com") }

      it { should_not be_nil }
      its(:email) { should eq "someguy@test.com" }
      it "password and password confirmation should match" do
        expect(user.password).to eq user.password_confirmation
      end

      it { should have(5).feeds }
    end

    context "it fails" do
      it "with no email" do
        user = FactoryGirl.build(:user, email: nil)
        expect(user).to be_invalid
      end

      it "with no password" do
        user = FactoryGirl.build(:user, password: nil)
        expect(user).to be_invalid
      end

      it "with no password confirmation" do
        user = FactoryGirl.build(:user, password_confirmation: nil)
        expect(user).to be_invalid
      end

      it "with a non-matching password confirmation/password combination" do
        user = FactoryGirl.build(:user, password: "qrstuv")
        expect(user).to be_invalid
      end
    end
  end

  describe "When logging in" do
    context "With a valid user and password" do
      subject (:user) { FactoryGirl.create(:user, email: "someguy@test.com") }

      it "logs in with the right email and password" do
        user.authenticate("abc123").should eq user
      end

      it "fails login with the wrong password" do
        user.authenticate("wrongwrongwrong").should eq false
      end
    end
  end

  describe "With a valid user" do
    subject (:user) { FactoryGirl.create(:user) }

    context "When adding a new feed" do
      before :each do
        user.feeds << FactoryGirl.create(:feed, user_id: user.id)
      end

      it { should have(6).feeds }
    end

    context "When deleting a feed" do
      before :each do
        user.feeds.last.destroy
      end
      
      it { should have(5).feeds }
    end
  end
end
