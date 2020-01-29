<?php
use Phalcon\Http\Response;

class CalendarController extends ControllerBase
{
	public function initialize()
	{
		parent::initialize();
		$this->view->setVar('title', "Calendar");
		$this->view->setVar('h1', "Calendar");
	}

	public function indexAction($year,$month)
	{
		if (empty($year))
		{
			$year = date('Y');
			$month = date('m');
		}
		$days = cal_days_in_month(CAL_GREGORIAN, $month, $year);
		$this->view->setVar('today', date('Y m d'));
		$this->view->setVar('year', $year);
		$this->view->setVar('month', $month);

		$daysArr = [];
		for ($i = 0; $i<$days; $i++){
			$daysArr[$i] = '';
		}

		$dayRecord = Days::find([
			'conditions'=>'year = :year: AND month = :month:',
			'bind'=>['year'=>$year, 'month'=>$month]
		]);
		$all = 0;
		foreach ($dayRecord as $value) {
			$daysArr[$value->day-1] = $value->comment;
			$all += floatval($value->comment); 
			print_r($value->comment);echo "<br>";
		}
		print_r($dayRecord->count());
		$average = $all/$dayRecord->count();

		$this->view->setVar('days', $daysArr);
		$this->view->setVar('all', $all);
		$this->view->setVar('average', $average);
	}

	public function saveDayAction(int $year,int $month, int $day, string $comment)
	{
		// это верну, когда разберусь как с токенами работать
		// if ($this->getDI()->getShared("session")->get('authUser')==false)
		// 	return "Not authorised";
		$dayRecord = Days::findFirst([
			'conditions'=>'year = :year: AND month = :month: AND day = :day:',
			'bind'=>['year'=>$year, 'month'=>$month, 'day'=>$day]
		]);
		echo $comment;
		if (!$dayRecord) {
			$dayRecord = new Days();

			$dayRecord->year = $year;
			$dayRecord->month = $month;
			$dayRecord->day = $day;
		}

		$dayRecord->comment = $comment;

		if ($dayRecord->save() === false) {
		    echo "Umh, We can't store days right now: \n";

		    $messages = $dayRecord->getMessages();

		    foreach ($messages as $message) {
		        echo $message, "\n";
		    }
		} else {
		    echo 'Great, a new dayRecord was saved successfully!';
		}
	}

	public function getDayAction(int $year,int $month, int $day)
	{
		$dayRecord = Days::findFirst([
			'conditions'=>'year = :year: AND month = :month: AND day = :day:',
			'bind'=>['year'=>$year, 'month'=>$month, 'day'=>$day]
		]);
		if (!$dayRecord) {
			echo '0';
		}
		else
			echo $dayRecord->comment;
	}
}
