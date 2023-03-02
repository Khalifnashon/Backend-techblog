class ReadersController < ApplicationController
    # Routings
        get "/readers" do
           readers = Reader.all
           readers.to_json
        end

        get "/readers/:id" do
            count_readers = Reader.where(id: params[:id]).count()
            if count_readers > 0
                readers = Reader.find(params[:id])
                readers.to_json
            else
                message = {:error => "blog not found"}
                message.to_json
            end
        end

        post "/readers" do
            name = params[:name]
            email = params[:email]

            if(name.present? && email.present?)
                check_email_exists = Reader.where(email: email).count() #Integer 2,3,4,5
                 puts("XXXXXXXXXXXXXXXXX ", check_email_exists)

                 if check_email_exists < 1
                    reader = Reader.create(name: name, email: email)
                    if reader
                        message = {:succcess => "Reader created successfully!!"}
                        message.to_json
                    else
                        message = {:error => "Error saving reader!"}
                        message.to_json
                    end
                else
                    message = {:error => "Email exists!"}
                    message.to_json
                end
            else
                message = {:error => "All fields should be field!"}
                message.to_json
            end
            
        end


        # delete
        delete "/readers/:id" do
            count_readers = Reader.where(id: params[:id]).count() #Integer 2,3,4,5
            if count_readers>0
                reader = Reader.find(params[:id])
                reader.destroy
                message = {:succcess => "User deleted successfully!!"}
                message.to_json

            else
                message = {:error => "Review does not exist!"}
                message.to_json
            end


        end




end