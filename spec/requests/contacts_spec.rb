require "spec_helper";

describe( "contacts requests" ) {
  subject { page };

  describe( "get /contacts unauthenticated" ) {
    before( ) { visit( contacts_path ); }

    describe( "source" ) {
      it( ) { should( have_selector( "h2", { text: "Sign in" } ) ); }
      it( ) { should( have_selector( "input#user_email" ) ); }
      it( ) { should( have_selector( "input#user_password" ) ); }

      describe( "post /users/sign_in" ) {
        let( :user_attr ) { FactoryGirl.attributes_for( :user ) }
        
        before( ) {
          User.create!( user_attr );

          User.first().confirm!();

          fill_in( "Email", { with: user_attr[:email] } );
          fill_in( "Password", { with: user_attr[:password] } );
          click_button( "Sign in" );
        }

        it( "should sign in" ) {
          should( have_selector( ".main h2", { text: "Contacts" } ) );
        }
      }
    }
  }
}

