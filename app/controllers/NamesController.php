<?php

class NamesController extends ControllerBase
{
	public function indexAction()
	{

	}

	public function generateAction()
	{
		$text = $this->request->getPost('names');
		$names = mb_strtolower($text); 
		$names = explode(' ', $names);
		foreach ($names as $key => $value) {
			$namesBit[$key] = $this->mbStringToArray($value);
		}
		$countArray = [
			'start' => [],
			'а'     => [],
			'б'     => [],
			'в'     => [],
			'г'     => [],
			'д'     => [],
			'е'     => [],
			'ё'     => [],
			'ж'     => [],
			'з'     => [],
			'и'     => [],
			'й'     => [],
			'к'     => [],
			'л'     => [],
			'м'     => [],
			'н'     => [],
			'о'     => [],
			'п'     => [],
			'р'     => [],
			'с'     => [],
			'т'     => [],
			'у'     => [],
			'ф'     => [],
			'х'     => [],
			'ц'     => [],
			'ч'     => [],
			'ш'     => [],
			'щ'     => [],
			'ъ'     => [],
			'ы'     => [],
			'ь'     => [],
			'э'     => [],
			'ю'     => [],
			'я'     => []
		];

		foreach ($countArray as $key => $value) 
		{

			$countArray[$key] = [
				'а'     => '0',
				'б'     => '0',
				'в'     => '0',
				'г'     => '0',
				'д'     => '0',
				'е'     => '0',
				'ё'     => '0',
				'ж'     => '0',
				'з'     => '0',
				'и'     => '0',
				'й'     => '0',
				'к'     => '0',
				'л'     => '0',
				'м'     => '0',
				'н'     => '0',
				'о'     => '0',
				'п'     => '0',
				'р'     => '0',
				'с'     => '0',
				'т'     => '0',
				'у'     => '0',
				'ф'     => '0',
				'х'     => '0',
				'ц'     => '0',
				'ч'     => '0',
				'ш'     => '0',
				'щ'     => '0',
				'ъ'     => '0',
				'ы'     => '0',
				'ь'     => '0',
				'э'     => '0',
				'ю'     => '0',
				'я'     => '0',
				'end'   => '0'
			];
		}
		
		foreach ($namesBit as $name) 
		{
			foreach ($name as $key => $symbol) 
			{

				if ($key == 0)
					$countArray['start'][$symbol] += 1;
				else
				{
					$countArray[$name[$key-1]][$symbol] +=1;
					if ($key == count($name)-1)
						$countArray[$symbol]['end'] += 1;
				}
			}
		}
		$startName = '';
		$name = $this->addChar('start', $countArray, $startName);
		$name = $this->mb_ucfirst($name);


		$this->view->setVar('text', $text);
		$this->view->setVar('generatedName', $name);
		$this->view->setVar('names', $names);
		$this->view->setVar('countArray', $countArray);
		// echo '<pre>';
		// print_r($name);
		// print_r($names);
		// //print_r($namesBit);
		// //print_r($countArray);
		// exit;
	}

	public function addChar($char, $countArray, $name)
	{
		$chanceArr = [];
		$count = 0;
		foreach ($countArray[$char] as $key => $value) 
		{
			$count += $value;
			if ($value!=0)
				for ($i=0; $i < $value; $i++) 
					$chanceArr[] = $key;
		}

		$index = array_rand($chanceArr);
		$charNew = $chanceArr[$index];
		if ($charNew == 'end')
			return $name;
		$name = $name.$charNew;



		return $this->addChar($charNew, $countArray, $name);

	}

	public function addNameAction()
	{

	}
}
