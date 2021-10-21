module Api
    module V1
        class ProjectsController < ApplicationController
            def index
                projects = Project.order('id');
                render json: {
                    status: 'success',
                    message: 'all projects',
                    data: projects
                }, status: :ok
            end

            def show
                project = Project.find(params[:id])
                render json: {
                    status: 'success',
                    message: 'project OK',
                    data: project
                }, status: :ok
            end

            def create
                project = Project.new(project_params)
                if project.save
                    render json: {
                        status: 'success',
                        message: 'project created',
                        data: project
                    }, status: :ok
                else
                    render json: {
                        status: 'failed',
                        message: 'project does not created',
                        data: project.errors
                    }, status: :unprocessable_entity
                end
            end
        
            def destroy
                project = Project.find(params[:id])
                if project.destroy
                    render json: {
                        status: 'success',
                        message: 'project deleted',
                        data: project
                    }, status: :ok
                else
                    render json: {
                        status: 'failed',
                        message: 'project does not deleted',
                        data: project.errors
                    }, status: :unprocessable_entity
                end
            end

            def update
                project = Project.find(params[:id])
                if project.update(project_params)
                    render json: {
                        status: 'success',
                        message: 'project updated',
                        data: project
                    }, status: :ok
                else
                    render json: {
                        status: 'failed',
                        message: 'project does not updated',
                        data: project.errors
                    }, status: :unprocessable_entity
                end
            end

            private

            def project_params
                params.permit(:title, :description, :github, :link, :techs)
            end
        end
    end
end


# El módulo debe colocarse primera mayúscula
# La clase se hereda de AppController, que nos permite acceder a la api de rails
