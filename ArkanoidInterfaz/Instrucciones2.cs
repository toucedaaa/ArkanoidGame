﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ArkanoidInterfaz
{
    public partial class Instrucciones2 : Form
    {
        public Instrucciones2()
        {
            InitializeComponent();
        }

        private void btbSiguiente_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
