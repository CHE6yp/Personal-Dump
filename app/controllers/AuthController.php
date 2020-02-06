<?php
use Phalcon\Http\Response;

class AuthController extends ControllerBase
{
    public function formAction()
    {

    }

    public function loginAction()
    {
    }

    public function logoutAction()
    {
        $sessions = $this->getDI()->getShared("session");
        $sessions->destroy();
        $response = new Response();
        $response->redirect("/");
        $response->send();
    }

    public function signinAction($value='')
    {
        $sessions = $this->getDI()->getShared("session");

        if ($sessions->has("authUser")) {
            //if user is already logged we dont need to do anything
            // so we redirect them to the main page
            return $this->response->redirect("/auth/login/");
        }

        if ($this->request->isPost()) {
            $password = $this->request->getPost("password");
            $username = $this->request->getPost("username");

            if ($username === "") {
                $this->flashSession->error("return enter your username");
                //pick up the same view to display the flash session errors
                return $this->view->pick("login");
            }

            if ($password === "") {
                $this->flashSession->error("return enter your password");
                //pick up the same view to display the flash session errors
                return $this->view->pick("login");
            }

            //for some fucking reason, binding results in $user never being false
            // $user = Users::findFirst([
            //     "conditions" => "username = ?0 AND password = ?1",
            //     "bind" == [
            //         0 => $username,
            //         // 1 => $this->security->hash($password)
            //         1 => $password
            //     ]
            // ]);
            $user = Users::findFirst([
                "conditions" => "username = '".$username."' AND password = '".$password."'"
            ]);

            var_dump($this->security->hash($password));die;

            if (false === $user) {
                $this->flashSession->error("wrong user / password");
            } else {
                $sessions->set("authUser", $user);
                $response = new Response();
                $response->redirect("/");
                $response->send();
            }
        }
    }

}