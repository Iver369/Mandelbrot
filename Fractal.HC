U0 Mandelbrot()
{
  I64 x, y,iter;
  I64 max_iter=64; 
  F64 real,imag;      
  F64 c_real,c_imag;  
  F64 temp_real;
  DCFill(gr.dc);
  Print("Rendering Fractals in Ring-0 Kernel...\n");
  for (y=0;y<480;y++) {
    for (x=0;x<640;x++) {
      c_real=(x-420.0)/150.0;
      c_imag=(y-240.0)/150.0;
      real=0;
      imag=0;
      for (iter=0;iter<max_iter;iter++) {
        temp_real=real*real-imag*imag+c_real;
        imag=2*real*imag+c_imag;
        real=temp_real;
        if (real*real+imag*imag>4.0)
          break;
      }
      if (iter<max_iter) {
        gr.dc->color=iter%15+1; 
        GrPlot(gr.dc,x,y);
      }
    }
  }
  Print("Press any key to exit\n");
  GetKey;
  DCFill(gr.dc);
}

Mandelbrot;