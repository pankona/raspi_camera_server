require 'rails_helper'

describe Photo do
  describe "get_photos" do
    context "normal case" do
      it "returns array of photos" do
        expect(Photo.get_photos).not_to be nil
      end
    end
  end
end
