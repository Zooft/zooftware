require 'spec_helper'

describe WelcomeController do
  before(:each) do
    @site = Factory.create(:site)
    @domain = Factory.create(:domain, :site=>@site, :domain=>"zooftware.test")
    request.host = @domain.domain
  end
  describe "GET 'index'" do
    it "should be successful when getting primary domain" do
      get 'index'
      response.should be_success
    end

    it "should redirect to primary domain" do
      d = Factory.create(:domain, :site=>@site, :domain=>"testhost.test")
      request.host = d.domain
      get 'index'
      response.should redirect_to(:host=>@domain.domain)
    end
  end

end
