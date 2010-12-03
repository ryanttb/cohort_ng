class NotesController < ApplicationController

  def new
    @note = Note.new(:contact_id => params[:contact_id])
    respond_to do|format|
      format.js { render :layout => false}
      format.html {}
    end
  end

  def create
    @note = Note.new
    @note.attributes = params[:note]
    @note.user = current_user
    respond_to do|format|
      if @note.save
        flash[:notice] = "Added that note"
        format.js { render :text => ''}
        format.html {redirect_to :action => :index}
      else
        format.js { render :text => "We couldn't add that note. <br />#{@note.errors.full_messages.join('<br/>')}", :status => :unprocessable_entity }
        format.html { render :action => :new }
      end
    end
  end

  def edit
    @note = Note.find(params[:id])
    respond_to do|format|
      format.js { render :template => 'notes/new', :layout => false}
      format.html {}
    end
  end

  def update
    @note = Note.find(params[:id])
    @note.attributes = params[:note]
    respond_to do|format|
      if @note.save
        flash[:notice] = "Updated that note"
        format.js { render :text => nil }
        format.html {redirect_to :action => :index}
      else
        format.js { render :text => "We couldn't update that note. <br />#{@note.errors.full_messages.join('<br/>')}", :status => :unprocessable_entity }
        format.html { render :action => :edit }
      end
    end
  end

end
