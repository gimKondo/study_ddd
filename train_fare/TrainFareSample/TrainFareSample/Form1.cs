using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace TrainFareSample
{
	public partial class Form1 : Form
	{
		public Form1()
		{
			InitializeComponent();

			Stations = new List<String>();
		}

		private List<String> Stations { get; set; }

		private void ClearStationData()
		{
			Stations.Clear();
			lstBxStartStation.Items.Clear();
			lstBxGoalStation.Items.Clear();
		}

		/// <summary>
		/// 駅データの読み込み
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void btnStationData_Click(object sender, EventArgs e)
		{
			var form = new OpenFileDialog();
			form.Filter = "txt files (*.txt)|*.txt|All files (*.*)|*.*" ;

			if (form.ShowDialog() != DialogResult.OK)
			{
				return;
			}

			ClearStationData();

			using (var reader = new StreamReader(form.FileName))
			{
				String name;
				while((name = reader.ReadLine()) != null)
				{
					Stations.Add(name);
					lstBxStartStation.Items.Add(name);
					lstBxGoalStation.Items.Add(name);
				}
			}
		}
	}
}
