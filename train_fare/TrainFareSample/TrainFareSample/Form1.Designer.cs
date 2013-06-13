namespace TrainFareSample
{
	partial class Form1
	{
		/// <summary>
		/// 必要なデザイナー変数です。
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// 使用中のリソースをすべてクリーンアップします。
		/// </summary>
		/// <param name="disposing">マネージ リソースが破棄される場合 true、破棄されない場合は false です。</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows フォーム デザイナーで生成されたコード

		/// <summary>
		/// デザイナー サポートに必要なメソッドです。このメソッドの内容を
		/// コード エディターで変更しないでください。
		/// </summary>
		private void InitializeComponent()
		{
			this.tbStationFile = new System.Windows.Forms.TextBox();
			this.label = new System.Windows.Forms.Label();
			this.btnStationData = new System.Windows.Forms.Button();
			this.lstBxStartStation = new System.Windows.Forms.ListBox();
			this.lstBxGoalStation = new System.Windows.Forms.ListBox();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.btnRide = new System.Windows.Forms.Button();
			this.btnExit = new System.Windows.Forms.Button();
			this.tbCardRestPrice = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.button4 = new System.Windows.Forms.Button();
			this.tbChargePrice = new System.Windows.Forms.TextBox();
			this.SuspendLayout();
			// 
			// tbStationFile
			// 
			this.tbStationFile.Location = new System.Drawing.Point(75, 12);
			this.tbStationFile.Name = "tbStationFile";
			this.tbStationFile.Size = new System.Drawing.Size(188, 19);
			this.tbStationFile.TabIndex = 0;
			// 
			// label
			// 
			this.label.AutoSize = true;
			this.label.Location = new System.Drawing.Point(12, 15);
			this.label.Name = "label";
			this.label.Size = new System.Drawing.Size(57, 12);
			this.label.TabIndex = 1;
			this.label.Text = "路線データ";
			// 
			// btnStationData
			// 
			this.btnStationData.Location = new System.Drawing.Point(269, 10);
			this.btnStationData.Name = "btnStationData";
			this.btnStationData.Size = new System.Drawing.Size(75, 23);
			this.btnStationData.TabIndex = 2;
			this.btnStationData.Text = "参照";
			this.btnStationData.UseVisualStyleBackColor = true;
			this.btnStationData.Click += new System.EventHandler(this.btnStationData_Click);
			// 
			// lstBxStartStation
			// 
			this.lstBxStartStation.FormattingEnabled = true;
			this.lstBxStartStation.ItemHeight = 12;
			this.lstBxStartStation.Location = new System.Drawing.Point(25, 65);
			this.lstBxStartStation.Name = "lstBxStartStation";
			this.lstBxStartStation.Size = new System.Drawing.Size(237, 100);
			this.lstBxStartStation.TabIndex = 3;
			// 
			// lstBxGoalStation
			// 
			this.lstBxGoalStation.FormattingEnabled = true;
			this.lstBxGoalStation.ItemHeight = 12;
			this.lstBxGoalStation.Location = new System.Drawing.Point(269, 65);
			this.lstBxGoalStation.Name = "lstBxGoalStation";
			this.lstBxGoalStation.Size = new System.Drawing.Size(237, 100);
			this.lstBxGoalStation.TabIndex = 4;
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(23, 50);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(41, 12);
			this.label2.TabIndex = 5;
			this.label2.Text = "乗車駅";
			// 
			// label3
			// 
			this.label3.AutoSize = true;
			this.label3.Location = new System.Drawing.Point(267, 50);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(41, 12);
			this.label3.TabIndex = 6;
			this.label3.Text = "降車駅";
			// 
			// btnRide
			// 
			this.btnRide.Location = new System.Drawing.Point(25, 172);
			this.btnRide.Name = "btnRide";
			this.btnRide.Size = new System.Drawing.Size(75, 23);
			this.btnRide.TabIndex = 7;
			this.btnRide.Text = "乗車";
			this.btnRide.UseVisualStyleBackColor = true;
			// 
			// btnExit
			// 
			this.btnExit.Location = new System.Drawing.Point(269, 172);
			this.btnExit.Name = "btnExit";
			this.btnExit.Size = new System.Drawing.Size(75, 23);
			this.btnExit.TabIndex = 8;
			this.btnExit.Text = "降車";
			this.btnExit.UseVisualStyleBackColor = true;
			// 
			// tbCardRestPrice
			// 
			this.tbCardRestPrice.Location = new System.Drawing.Point(429, 254);
			this.tbCardRestPrice.Name = "tbCardRestPrice";
			this.tbCardRestPrice.Size = new System.Drawing.Size(123, 19);
			this.tbCardRestPrice.TabIndex = 9;
			// 
			// label4
			// 
			this.label4.AutoSize = true;
			this.label4.Location = new System.Drawing.Point(388, 257);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(29, 12);
			this.label4.TabIndex = 10;
			this.label4.Text = "残高";
			// 
			// button4
			// 
			this.button4.Location = new System.Drawing.Point(25, 252);
			this.button4.Name = "button4";
			this.button4.Size = new System.Drawing.Size(75, 23);
			this.button4.TabIndex = 11;
			this.button4.Text = "チャージ";
			this.button4.UseVisualStyleBackColor = true;
			// 
			// tbChargePrice
			// 
			this.tbChargePrice.Location = new System.Drawing.Point(116, 252);
			this.tbChargePrice.Name = "tbChargePrice";
			this.tbChargePrice.Size = new System.Drawing.Size(145, 19);
			this.tbChargePrice.TabIndex = 12;
			// 
			// Form1
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(564, 285);
			this.Controls.Add(this.tbChargePrice);
			this.Controls.Add(this.button4);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.tbCardRestPrice);
			this.Controls.Add(this.btnExit);
			this.Controls.Add(this.btnRide);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.lstBxGoalStation);
			this.Controls.Add(this.lstBxStartStation);
			this.Controls.Add(this.btnStationData);
			this.Controls.Add(this.label);
			this.Controls.Add(this.tbStationFile);
			this.Name = "Form1";
			this.Text = "p";
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.TextBox tbStationFile;
		private System.Windows.Forms.Label label;
		private System.Windows.Forms.Button btnStationData;
		private System.Windows.Forms.ListBox lstBxStartStation;
		private System.Windows.Forms.ListBox lstBxGoalStation;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Button btnRide;
		private System.Windows.Forms.Button btnExit;
		private System.Windows.Forms.TextBox tbCardRestPrice;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Button button4;
		private System.Windows.Forms.TextBox tbChargePrice;
	}
}

