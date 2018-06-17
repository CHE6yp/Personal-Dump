<?php
use Phalcon\Http\Response;

class AuthController extends ControllerBase
{

    public function formAction()
    {

    }

    public function loginAction() 
    {

        $sessions = $this->getDI()->getShared("session");

        if ($sessions->has("user_id")) {
            //if user is already logged we dont need to do anything 
            // so we redirect them to the main page
            return $this->response->redirect("/");
        }

        if ($this->request->isPost()) {

            $password = $this->request->getPost("password");
            $email = $this->request->getPost("email");

            if ($email === "") {
                $this->flashSession->error("return enter your email");
                //pick up the same view to display the flash session errors
                return $this->view->pick("login");
            }

            if ($password === "") {
                $this->flashSession->error("return enter your password");
                //pick up the same view to display the flash session errors
                return $this->view->pick("login");
            }

            $user = Users::findFirst([
                "conditions" => "email = ?0 AND password = ?1",
                "bind" == [
                    0 => $email,
                    1 => $this->security->hash($password)
                ]
            ]);

            if (false === $user) {
                $this->flashSession->error("wrong user / password");
            } else {
                $sessions->set("user_id", $user->id);
                $response = new Response();
                $response->redirect("/");
                $response->send();
            }
        }

    }

}