require "spec_helper";

describe( "contacts requests" ) {
  subject { page };

  describe( "get /contacts unauthenticated" ) {
    before( ) { visit( contacts_path ); }

    describe( "source" ) {
      it( ) { should( have_selector( "h2", { text: "Sign in" } ) ); }
      it( ) { should( have_selector( "input#user_email" ) ); }
      it( ) { should( have_selector( "input#user_password" ) ); }

#      describe( "post /users/sign_in" ) {
#        let( :user ) { FactoryGirl.create( :user ) }
#        
#        before( ) {
#          fill_in( "Email", { with: "rwestphal@cyber.law.harvard.edu" } );
#          fill_in( "Password", { with: "foobar" } );
#          click_button( "Sign in" );
#        }
#
#        it( "should sign in" ) {
#          should( have_selector( ".main h2", { text: "Contacts" } ) );
#        }
#      }
    }
  }
}

