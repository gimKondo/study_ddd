using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TrainFareSample
{
	class Station
	{
		public int ID { get; set; }
	}


	class Pathway
	{
		Station Start { get; set; }
		Station Goal { get; set; }
		List<Station> Transits { get; set; }
	}
}
