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
		foreach ($dayRecord as $value) {
			$daysArr[$value->day-1] = $value->comment;
		}

		$this->view->setVar('days', $daysArr);
	}

	public function saveDayAction(int $year,int $month, int $day, $comment)
	{
		$dayRecord = Days::findFirst([
			'conditions'=>'year = :year: AND month = :month: AND day = :day:',
			'bind'=>['year'=>$year, 'month'=>$month, 'day'=>$day]
		]);

		if (!$dayRecord) {
			echo "new record";
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
}
