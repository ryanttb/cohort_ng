require "spec_helper";

describe( "contacts requests" ) {
  let( :user_attr ) { FactoryGirl.attributes_for( :user ) }

  subject { page };

  describe( "get /contacts unauthenticated" ) {
    before( ) { visit( contacts_path ); }

    describe( "source" ) {
      it( ) { should( have_selector( ".main h2", { text: "Sign in" } ) ); }
      it( ) { should( have_selector( "input#user_email" ) ); }
      it( ) { should( have_selector( "input#user_password" ) ); }
    }

    describe( "post /users/sign_in" ) {
      before( ) {
        User.create!( user_attr );

        User.first().confirm!();

        fill_in( "Email", { with: user_attr[:email] } );
        fill_in( "Password", { with: user_attr[:password] } );
        click_button( "Sign in" );
      }

      it( "should sign in" ) {
        should_not( have_selector( ".main h2", { text: "Sign in" } ) );
      }
    }
  }

  describe( "get /contacts" ) {
    before( ) {
      visit( contacts_path );
      User.create!( user_attr );

      User.first().confirm!();

      fill_in( "Email", { with: user_attr[:email] } );
      fill_in( "Password", { with: user_attr[:password] } );
      click_button( "Sign in" );
    }

    describe( "source" ) {
      it( ) { should( have_selector( ".main h2", { text: "Contacts" } ) ); }
      #it( "should have edit link" ) { should( have_selector( "a.dialog-form[title='Edit Contact']" ) ); }
    }
  }

}

