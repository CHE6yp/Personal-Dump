<?php

class LauncherController extends ControllerBase
{
	public function indexAction()
	{

		// $page = Page::findFirstById($id);
		// if (!$page)
		// 	exit ('NO PAGE!');
		// $this->view->setVar("page", $page); 
	}

	public function updateGameFilesAction($title)
	{
		if (!isset($title))
		    exit ('Ups');

		$filesFromDisk = $this->getDirContents('/var/www/html/public/Games/'.$title);

		//для начала глянем че у нас там за файлы на диске и соберем их
		$disk = [];
		foreach ($filesFromDisk as $key => $value) {
		    # code...
		    $disk[] = [ false, str_replace('/var/www/html/public/Games/', '', $value), md5_file($value)];
		}

		//берем список файлов из базы
		$game = Game::findFirstByTitle($title);
		$filesFromDB = $game->GameFiles;

		$changed = []; $added = []; $removed = [];
		foreach ($filesFromDB as $dbFile) 
		{
			$found = false;
			foreach ($disk as $key => $diskFile) 
			{
				if (($diskFile[0]==false) && ($dbFile->filename == $diskFile[1]))
				{
					$disk[$key][0] = true;
					if ($dbFile->hash != $diskFile[2])
					{
						$changed[] = $diskFile;
						//сразу меняем запись
						$dbFile->hash = $diskFile[2];
						$dbFile->update();
						echo "Updated: ".$dbFile->filename."    Hash: ".$dbFile->hash.'<br>';
					}
					$found = true;
				}
			}
			if (!$found)
			{
				$removed[] = [$dbFile->filename, $dbFile->hash]; //сразу удали
				echo "Deleted: ".$dbFile->filename."    Hash: ".$dbFile->hash.'<br>';
				$dbFile->delete();
			}
		}

		//если в цикле ниче не нашли то значит файл новый
		foreach ($disk as $diskFile) 
		{
			if (!$diskFile[0])
			{
				$added[] = $diskFile; //сразу добавь запись
				$newFile = new GameFiles();
				$newFile->game_id = $game->id;
				$newFile->filename = $diskFile[1];
				$newFile->hash = $diskFile[2];
				if ($newFile->save())
					echo "Added: ".$newFile->filename."    Hash: ".$newFile->hash.'<br>';
				else 
				{
					echo "Can't save: ".$newFile->filename."    Hash: ".$newFile->hash.'<br>';
					foreach ($newFile->getMessages() as $key => $value) {
						echo $value.' !!!<br>';
					}
				}
			}
		}

	}

	public function getGamesAction()
	{
		$games = Game::find();
		//echo $this->jsonResult($games);
		foreach ($games as $key => $value) {
			if ($value->active == 1)
		    	echo $value->title.';'.$value->description.';'.$value->screenshot.';'.$value->launcher.'#';
		    	//$this->jsonResult($value);
		}
		//$this->jsonResult($games);
	}

	public function getGameFilesAction($title)
	{

		if (!isset($title))
		    exit ('Ups');


		$game = Game::findFirstByTitle($title);
		$filesFromDB = $game->GameFiles;

		foreach ($filesFromDB as $key => $value) {
		    # code...
		    //echo str_replace('/var/www/html/public/Games/', '', $value).'!';
		    echo $value->filename.';'.$value->hash.'#';
		}
	}

	function getDirContents($dir, &$results = array()){
	    $files = scandir($dir);

	    foreach($files as $key => $value){
	        $path = realpath($dir.DIRECTORY_SEPARATOR.$value);
	        if(!is_dir($path)) {
	            $results[] = $path;
	            //$results[] = $path.' Last Modifyied = '.date ("F d Y H:i:s.",filemtime($path));
	        } else if($value != "." && $value != "..") {
	            $this->getDirContents($path, $results);
	        }
	    }

	    return $results;
	}
}
