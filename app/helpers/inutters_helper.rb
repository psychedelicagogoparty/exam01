module InuttersHelper
    
    def choose_new_or_edit
     if action_name == 'new' || action_name == 'confirm'
        confirm_inutters_path
     elsif action_name == 'edit'
        inutter_path
     end
    end
end
