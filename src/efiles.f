c     Reads energy file names and open the files for reading.
      subroutine enefiles
      character*80 filen,path*4096, cur_executable_path*4096
 
c     Get path for energy files
 915  format(a4096)
      call system('(MFLD_PATH=$(which mfold); MFLD_PATH=$(dirname "${MFLD_PATH// /\ }"); eval command cd "$(echo "$MFLD_PATH")/../share/mfold" && pwd) > mfold_path.txt')
      open(15,file='mfold_path.txt',status='old',err=99)
      read (15,915) cur_executable_path
      close(15)
      call system('rm mfold_path.txt')
      path = trim(cur_executable_path)//'/:'

      
 3    write(6,*) 'Enter asymmetric interior loop of size 3 energy file name'
      call flush(6)
      write(6,*) '(default asint1x2.dat)'
      call flush(6)
      read (5,100,end=1) filen
      if (filen.eq.'         ') filen = 'asint1x2.dat'
      open(8,file=filen,status='old',err=4)
      goto 5
 4    open(8,file=path(1:index(path,':')-1)//filen,status='old',err=3)

 5    write(6,*) 'Enter asymmetric interior loop of size 5 energy file name'
      call flush(6)
      write(6,*) '(default asint2x3.dat)'
      call flush(6)
      read (5,100,end=1) filen
      if (filen.eq.'         ') filen = 'asint2x3.dat'
c      open(9,file=filen,status='old',err=6)
      goto 10
c 6    open(9,file=path(1:index(path,':')-1)//filen,status='old',err=5)

10    write(6,*) 'Enter dangle energy file name (default dangle.dat)'
      call flush(6)
      read (5,100,end=1) filen
      if (filen.eq.'         ') filen = 'dangle.dat'
      open(10,file=filen,status='old',err=11)
      goto 20
11    open(10,file=path(1:index(path,':')-1)//filen,status='old',err=10)
 
20    write(6,*) 'Enter loop energy file name (default loop.dat)'
      call flush(6)
      read (5,100,end=1) filen
      if (filen.eq.'         ') filen = 'loop.dat'
      open(11,file=filen,status='old',err=21)
      goto 25
21    open(11,file=path(1:index(path,':')-1)//filen,status='old',err=20)
 
25    write(6,*) 'Enter misc. loop energy file name (default miscloop.dat)'
      call flush(6)
      read (5,100,end=1) filen
      if (filen.eq.'         ') filen = 'miscloop.dat'
      open(32,file=filen,status='old',err=26)
      goto 30
26    open(32,file=path(1:index(path,':')-1)//filen,status='old',err=25)
 
30    write(6,*)'Enter symmetric interior loop of size 2 energy file'
      call flush(6)
      write(6,*)' name (default sint2.dat)'
      call flush(6)
      read(5,100,end=1)filen
      if(filen.eq.'         ')filen='sint2.dat'
      open(33,file=filen,status='old',err=31)
      goto 35
31    open(33,file=path(1:index(path,':')-1)//filen,status='old',err=30)

35    write(6,*)'Enter symmetric interior loop of size 4 energy file'
      call flush(6)
      write(6,*)' name (default sint4.dat)'
      call flush(6)
      read(5,100,end=1)filen
      if(filen.eq.'         ')filen='sint4.dat'
      open(34,file=filen,status='old',err=36) 
      goto 37
36    open(34,file=path(1:index(path,':')-1)//filen,status='old',err=35)

37    write(6,*)'Enter symmetric interior loop of size 6 energy file'
      call flush(6)
      write(6,*)' name (default sint6.dat)'
      call flush(6)
      read(5,100,end=1)filen
      if(filen.eq.'         ')filen='sint6.dat'
c      open(35,file=filen,status='old',err=38)
      goto 40
c38    open(35,file=path(1:index(path,':')-1)//filen,status='old',err=37)
 
40    write(6,*) 'Enter stack energy file name (default stack.dat)'
      call flush(6)
      read (5,100,end=1) filen
      if (filen.eq.'         ') filen = 'stack.dat'
      open(12,file=filen,status='old',err=41)
      goto 45
41    open(12,file=path(1:index(path,':')-1)//filen,status='old',err=40)

45    write(6,*) 'Enter tetraloop energy file name (default tloop.dat)'
      call flush(6)
      read (5,100,end=1) filen
      if (filen.eq.'         ') filen = 'tloop.dat'
      open(29,file=filen,status='old',err=46)
      goto 47
46    open(29,file=path(1:index(path,':')-1)//filen,status='old',err=45)

47    write(6,*) 'Enter triloop energy file name (default triloop.dat)'
      call flush(6)
      read(5,100,end=1) filen
      if (filen.eq.'         ') filen = 'triloop.dat'
      open(39,file=filen,status='old',err=48)
      goto 50
48    open(39,file=path(1:index(path,':')-1)//filen,status='old',err=47)
 
50    write(6,*)'Enter tstackh energy file name (default tstackh.dat)'
      call flush(6)
      read(5,100,end=1)filen
      if(filen.eq.'         ') filen = 'tstackh.dat'
      open(13,file=filen,status='old',err=51)
      goto 55
51    open(13,file=path(1:index(path,':')-1)//filen,status='old',err=50)
 
55    write(6,*) 'Enter tstacki energy file name (default tstacki.dat)'
      call flush(6)
      read (5,100,end=1) filen
      if (filen.eq.'         ') filen = 'tstacki.dat'
      open(14,file=filen,status='old',err=56)
      goto 2
56    open(14,file=path(1:index(path,':')-1)//filen,status='old',err=55)
      write(6, *) 'CHECK PATH!!!!!', path(1:index(path,':')-1)//filen
      call flush(6)
 
100   format(a40)
      goto 2
1     stop
2     return
 99   write(6,*) 'Error opening file "tmp" input data file(s)'
      call flush(6)
      call flush(6)
      call exit(1)
      end

c     Reads energy files.
      subroutine ergread
 
      include 'rna.inc'
      logical  endfile,zfind
      character*96 inrec
      character*6 temp
      real a,b,c,d,rj,rk
 
c     TLoop INFORMATION IN
      call gettloops
 
c     TriLoop INFORMATION IN
      call gettri

c     Get misc loop info
      if(zfind(32,'-->')) then
         write(6,*) 'STOP: Premature end of miscloop file'
         call flush(6)
         call exit(1)
      endif
      read (32,*) prelog
      prelog = nint(prelog*prec)
c     asymmetric internal loops: the ninio equation
      if(zfind(32,'-->')) then
         write(6,*) 'STOP: Premature end of miscloop file'
         call flush(6)
         call exit(1)
      endif
      read (32,*) a
      maxpen = nint(a*prec)
      if(zfind(32,'-->')) then
         write(6,*) 'STOP: Premature end of miscloop file'
         call flush(6)
         call exit(1)
      endif
      read (32,*) a,b,c,d
      poppen(1) = nint(a*prec)
      poppen(2) = nint(b*prec)
      poppen(3) = nint(c*prec)
      poppen(4) = nint(d*prec)
c     Set default values of eparam.
      eparam(1) = 0
      eparam(2) = 0
      eparam(3) = 0
      eparam(4) = 0
      eparam(7) = 30
      eparam(8) = 30
c      eparam(9) = -500 Bonus energies are no longer used!
c     multibranched loops
      if(zfind(32,'-->')) then
         write(6,*) 'STOP: Premature end of miscloop file'
         call flush(6)
         call exit(1)
      endif
      read (32,*) a,b,c
      eparam(5) = nint(a*prec)
      eparam(6) = nint(b*prec)
      eparam(9) = nint(c*prec)
c     efn2 multibranched loops
      if(zfind(32,'-->')) then
c     Version 2.3 rules and DNA rules do not need extra parameters
         write(6,*) 'End of miscloop file. Parameters 10 -> end set to 0.'
         call flush(6)
         do k= 10,16
            eparam(k) = 0
         enddo
      else
         read (32,*) a,b,c
c        Don't need these parameters yet in nafold
c        terminal AU penalty
         if(zfind(32,'-->')) then
            write(6,*) 'STOP: Premature end of miscloop file'
            call flush(6)
            call exit(1)
         endif
         read (32,*) a
         eparam(10) = nint(a*prec)
c        bonus for GGG hairpin
         if(zfind(32,'-->')) then
            write(6,*) 'STOP: Premature end of miscloop file'
            call flush(6)
            call exit(1)
         endif
         read (32,*) a
         eparam(11) = nint(a*prec)
c        c hairpin slope
         if(zfind(32,'-->')) then
            write(6,*) 'STOP: Premature end of miscloop file'
            call flush(6)
            call exit(1)
         endif
         read (32,*) a
         eparam(12) = nint(a*prec)
c        c hairpin intercept
         if(zfind(32,'-->')) then
            write(6,*) 'STOP: Premature end of miscloop file'
            call flush(6)
            call exit(1)
         endif
         read (32,*) a
         eparam(13) = nint(a*prec)
c        c hairpin of 3
         if(zfind(32,'-->')) then
            write(6,*) 'STOP: Premature end of miscloop file'
            call flush(6)
            call exit(1)
         endif
         read (32,*) a
         eparam(14) = nint(a*prec)
c        Intermolecular initiation free energy
         if(zfind(32,'-->')) then
            write(6,*) 'STOP: Premature end of miscloop file'
            call flush(6)
            call exit(1)
         endif
         read (32,*) a
         eparam(15) = nint(a*prec)
c        GAIL (Grossly Asymmetric Interior Loop) Rule (on/off <-> 1/0)
         if(zfind(32,'-->')) then
            write(6,*) 'STOP: Premature end of miscloop file'
            call flush(6)
            call exit(1)
         endif
         read (32,*) eparam(16)
      endif

c     DANGLE IN
 
      do a = 1,5
        do b = 1,5
          do c = 1,5
            do d = 1,2
              dangle(a,b,c,d) = 0
            enddo
          enddo
        enddo
      enddo
      endfile = zfind(10,'<--')
      if (.not.endfile) then
         do var4 = 1,2
            do var1 = 1,4
               if (endfile) goto 150
               read(10,100,end=150,err=91) inrec
               do var2 = 1,4
                  do var3 = 1,4
                     j = 0
                     tstart = (var2-1)*24 + (var3-1)*6 + 1
                     temp = inrec(tstart:tstart+5)
                     do i = 2,5
                        if (temp(i-1:i+1).eq.' . ') j = infinity
                     enddo
                     if (temp(1:1).eq.'.'.or.temp(6:6).eq.'.') j = infinity
                     if (j.eq.0) then 
                        read(temp,50) rj
                        dangle(var1,var2,var3,var4) = nint(prec*rj)
                     endif
                  enddo
               enddo
               endfile = zfind(10,'<--')
            enddo
         enddo
      else
         write(6,*) 'STOP: DANGLE ENERGY FILE NOT FOUND'
         call flush(6)
         call exit(1)
      endif
 
 50   format(f6.2)
 100  format(a96)
      goto 200
 
 150  write(6,*) 'STOP: PREMATURE END OF DANGLE ENERGY FILE'
      call flush(6)
      call exit(1)
 
 
c    INTERNAL,BULGE AND HAIRPIN IN
 
 200  endfile = zfind(11,'---')
      if (endfile) then
         write(6,*) 'STOP: --- header not found in loop energy file'
         call flush(6)
         call exit(1)
      endif
      i = 1
 201  read(11,100,end=300) inrec
      j = -1
      do ii = 1,3
         j = j + 6
         do while (inrec(j:j).eq.' ')
            j = j + 1
         enddo
         temp = inrec(j:j+5)
         k = 0
         do jj = 2,4
            if (temp(jj-1:jj+1).eq.' . ') k = infinity
         enddo
         if (temp(1:1).eq.'.'.or.temp(6:6).eq.'.') then
            k = infinity
         endif
         if (k.eq.0) then
            read(temp,50) rk
            if (ii.eq.1) inter(i) = nint(prec*rk)
            if (ii.eq.2) bulge(i) = nint(prec*rk)
            if (ii.eq.3) hairpin(i) = nint(prec*rk)
         endif
      enddo
      i = i + 1
      if (i.le.30) goto 201
 
c     STACK IN
 
300   do a = 1,5
        do b = 1,5
          do c = 1,5
            do d = 1,5
              stack(a,b,c,d) = infinity
            enddo
          enddo
        enddo
      enddo
      endfile = zfind(12,'<--')
      if (.not.endfile) then
         do var1 = 1,4
            do var3 = 1,4
               if (endfile) goto 350
               read(12,100,end=350,err=92) inrec
               do var2 = 1,4
                  do var4 = 1,4
                     j = 0
                     tstart = (var2-1)*24 + (var4-1)*6 + 1
                     temp = inrec(tstart:tstart+5)
                     do i = 2,5
                        if (temp(i-1:i+1).eq.' . ') j = infinity
                     enddo
                     if (temp(1:1).eq.'.'.or.temp(6:6).eq.'.') j = infinity
                     if (j.eq.0) then
                        read(temp,50) rj
                        stack(var1,var2,var3,var4) = nint(prec*rj)
                     endif
                  enddo
               enddo
            enddo
            endfile = zfind(12,'<--')
         enddo
      else
         write(6,*) 'STOP: STACK ENERGY FILE NOT FOUND'
         call flush(6)
         call exit(1)
      endif
      call stest(stack,'STACK ')
 
      goto 400

 350   write(6,*) 'STOP: PREMATURE END OF STACK ENERGY FILE'
       call flush(6)
       call exit(1)

400   do a = 1,5
        do b = 1,5
          do c = 1,5
            do d = 1,5
              tstkh(a,b,c,d) = 0
            enddo
          enddo
        enddo
      enddo
      endfile = zfind(13,'<--')
      if (.not.endfile) then
         do var1 = 1,4
            do var3 = 1,4
               if (endfile) goto 350
               read(13,100,end=450,err=93) inrec
               do var2 = 1,4
                  do var4 = 1,4
                     j = 0
                     tstart = (var2-1)*24 + (var4-1)*6 + 1
                     temp = inrec(tstart:tstart+5)
                     do i = 2,5
                        if (temp(i-1:i+1).eq.' . ') j = infinity
                     enddo
                     if (temp(1:1).eq.'.'.or.temp(6:6).eq.'.') j = infinity
                     if (j.eq.0) then
                        read(temp,50) rj
                        tstkh(var1,var2,var3,var4) = nint(prec*rj)
                     endif
                  enddo
               enddo
            enddo
            endfile = zfind(13,'<--')
         enddo
      else
         write(6,*) 'STOP: TSTACKH ENERGY FILE NOT FOUND'
         call flush(6)
         call exit(1)
      endif

c**   CALL STEST(TSTK,'TSTACK')
      goto 500

 450  write(6,*) 'STOP: PREMATURE END OF TSTACKH ENERGY FILE'
      call flush(6)
      call exit(1)
 500  do a = 1,5
        do b = 1,5
          do c = 1,5
            do d = 1,5
              tstki(a,b,c,d) = 0
            enddo
          enddo
        enddo
      enddo

      endfile = zfind(14,'<--')
      if (.not.endfile) then
         do var1 = 1,4
            do var3 = 1,4
               if (endfile) goto 450
               read(14,100,end=550,err=94) inrec
               do var2 = 1,4
                  do var4 = 1,4
                     j = 0
                     tstart = (var2-1)*24 + (var4-1)*6 + 1
                     temp = inrec(tstart:tstart+5)
                     do i = 2,5
                        if (temp(i-1:i+1).eq.' . ') j = infinity
                     enddo
                     if (temp(1:1).eq.'.'.or.temp(6:6).eq.'.') j = infinity
                     if (j.eq.0) then
                        read(temp,50) rj
                        tstki(var1,var2,var3,var4) = nint(prec*rj)
                     endif
                  enddo
               enddo
            enddo
            endfile = zfind(14,'<--')
         enddo
      else
         write(6,*) 'STOP: TSTACKI ENERGY FILE NOT FOUND'
         call flush(6)
         call exit(1)
      endif

c**   call stest(tstki,'TSTACKI')
      goto 600

550   write(6,*) 'STOP: PREMATURE END OF TSTACK ENERGY FILE'
      call flush(6)
      call exit(1)

c  Read in symmetric interior loop energies
600   call symint

c  Read in asymmetric interior loop energies
      call asmint

      call symtest

      close(8)
      close(9)
      close(10)
      close(11)
      close(12)
      close(13)
      close(14)
      close(32)
      close(33)
      close(34)
      close(35)
      close(39)

      return
 91   write(6,*) 'STOP: ERROR reading dangle energy file'
      call flush(6)
      call exit(1)

 92   write(6,*) 'STOP: ERROR reading stacking energy file'
      call flush(6)
      call exit(1)

 93   write(6,*) 'STOP: ERROR reading tstackh energy file'
      call flush(6)
      call exit(1)

 94   write(6,*) 'STOP: ERROR reading tstacki energy file'
      call flush(6)
      call exit(1)
      end

c     Symmetry test on stacking and terminal stacking energies.
c     For all i,j,k,l between 1 and 4, stack(i,j,k,l) MUST equal
c     stack(l,k,j,i). If this fails at some i,j,k,l; these numbers
c     are printed out and the programs grinds to an abrupt halt!
      subroutine stest(stack,sname)
      integer stack(5,5,5,5),a,b,c,d
      character*6 sname
 
      do a = 1,4
        do b = 1,4
          do c = 1,4
            do d = 1,4
              if (stack(a,b,c,d).ne.stack(d,c,b,a)) then
                 write(6,*) 'SYMMETRY ERROR in stack'
                 call flush(6)
                 write(6,101) sname,a,b,c,d,stack(a,b,c,d)
                 call flush(6)
                 write(6,101) sname,d,c,b,a,stack(d,c,b,a)
                 call flush(6)
                 call exit(1)
              endif
            enddo
          enddo
        enddo
      enddo
      return
101   format(5x,a6,'(',3(i1,','),i1,') = ',i10)
      end
 
c     Writes out the numbers in the energy arrays of the folding program.
      subroutine out(u)
      include 'rna.inc'
      integer*2 tlptr,key,bptr,nbase
      character*4 tlbuf
 
c     used for testing contents of energy arrays only
c     not used in the mature program
 
      write(u,100) 'DANGLE'
      call flush(u)
      do var4 = 1,2
        do var1 = 1,4
                  write(u,101) ((dangle(var1,var2,var3,var4),var3=1,4),
     .                            var2=1,4)
                  call flush(u)
          write(6,103)
          call flush(6)
        enddo
        write(6,104)
        call flush(6)
      enddo
 
      write(u,100) 'TSTACKH'
      call flush(u)
      do var1 = 1,4
        do var3 = 1,4
                  write(u,101) ((tstkh(var1,var2,var3,var4),var4=1,4),
     .                            var2=1,4)
                  call flush(u)
          write(6,103)
          call flush(6)
        enddo
        write(6,104)
        call flush(6)
      enddo

      write(u,100) 'TSTACKI'
      call flush(u)
      do var1 = 1,4
        do var3 = 1,4
                  write(u,101) ((tstki(var1,var2,var3,var4),var4=1,4),
     .                            var2=1,4)
                  call flush(u)
          write(6,103)
          call flush(6)
        enddo
        write(6,104)
        call flush(6)
      enddo

      write(u,100) 'STACK'
      call flush(u)
      do var1 = 1,4
        do var3 = 1,4
                  write(u,101) ((stack(var1,var2,var3,var4),var4=1,4),
     .                            var2=1,4)
                  call flush(u)
          write(6,103)
          call flush(6)
        enddo
        write(6,104)
        call flush(6)
      enddo
 
      write(u,200) 'INTER','BULGE','HAIRPIN'
      call flush(u)
      do i = 1,30
        write(u,201) i,inter(i),bulge(i),hairpin(i)
        call flush(u)
      enddo
 
      write(u,100) 'TLoops'
      call flush(u)
      do tlptr=1,numtloops
      key=tloop(tlptr,1)
         do bptr=1,4
            nbase=mod(key,8)
            key=key/8
            if (nbase.eq.1) then
               tlbuf(bptr:bptr)='A'
            elseif (nbase.eq.2) then
               tlbuf(bptr:bptr)='C'
            elseif (nbase.eq.3) then
               tlbuf(bptr:bptr)='G'
            else
               tlbuf(bptr:bptr)='U'
           endif
         enddo
      write(u,205) tlbuf,tloop(tlptr,2)
      call flush(u)
      enddo
      return
100   format(//,a40,//)
101   format(16i6)
103   format(' ')
104   format(/)
200   format(3a20,/,60('-'),/)
201   format(i4,i16,2i20)
205   format(a4,2x,i8)
      end
 
c     Used in reading the energy files.
c     Locates markers in the energy files so that data can be read
c     properly.
      function zfind(unit,str)
      implicit integer (a-z)
      logical zfind
      character*3 str
      character*96 inrec

      read(unit,100,end=200) inrec
      do  while (index(inrec,str).eq.0)
         read(unit,100,end=200) inrec
      enddo
      zfind = .false.
      return
 100  format(a96)
 200  zfind = .true.
      return
      end
 
      subroutine gettloops
c------------Kevin added below-----------------------------------------
      include 'rna.inc'
      integer flag,i,j,numseqn(6)
      real energy
      character row*80,seqn*6

 2020 format(a80)
 2021 format(1x,a6,1x,f6.2)

      flag=0
      do while(flag.eq.0)
         read(29,2020,err=91)row
         if(index(row,'---').gt.0)then
            flag=1
         endif
      enddo    

      flag=0
      j=0
      do while(flag.eq.0)
         j=j+1
         read(29,2021,end=99,err=91)seqn,energy

         if(index(seqn,'    ').gt.0.or.j.eq.maxtloops)then
            flag=1
            numtloops=j-1
         else
            do i=1,6
               call letr2num(seqn(i:i),numseqn(i))
            enddo

            tloop(j,1)=((((numseqn(6)*8+numseqn(5))*8+numseqn(4))*8+
     .       numseqn(3))*8+numseqn(2))*8+numseqn(1)
            tloop(j,2)=nint(prec*energy)
         endif
      enddo   

      close(29,status='KEEP')

      return

 91   write(6,*) 'STOP: ERROR reading tetraloop file'
      call flush(6)
      call exit(1)

 99   close(29,status='KEEP')
      numtloops=j-1

      return

      end

c---------------Kevin added above------------------------------------

c   Reads sequence and energy for triloop.d__ and stores info in array triloop
      subroutine gettri

      include 'rna.inc'
      integer i,j,flag,numseqn(5)
      real energy
      character row*80,seqn*5

 3030 format(a80)
 3031 format(1x,a5,2x,f6.2)

      flag=0
      do while(flag.eq.0)
         read(39,3030,err=91)row
         if(index(row,'---').gt.0)then
            flag=1
         endif
      enddo
      flag=0
      i=0
      do while(flag.eq.0)
         i=i+1

         if(i.eq.maxtriloops)then
            numtriloops=i
            flag=1
         endif

         read(39,3031,end=98,err=91)seqn,energy

         if(index(seqn,'   ').gt.0)then
            numtriloops=i-1
            flag=1
         else
            do j=1,5
               call letr2num(seqn(j:j),numseqn(j))
            enddo
 
            triloop(i,1)=(((numseqn(5)*8+numseqn(4))*8+numseqn(3))*8+
     .       numseqn(2))*8+numseqn(1)
            triloop(i,2)=nint(prec*energy)
         endif
      enddo

      return

 98   continue
      numtriloops=i-1

      return

 91   write(6,*) 'STOP: ERROR reading triloop file'
      call flush(6)
      call exit(1)
      end
c----------------------------------------------------------------
         subroutine letr2num(letr,num)
         
         integer num
         character*1 letr

         if(letr.eq.'A')then
            num=1
         elseif(letr.eq.'C')then
            num=2
         elseif(letr.eq.'G')then
            num=3
         elseif(letr.eq.'U'.or.letr.eq.'T')then
            num=4
         endif

      return
1     format(/)
2     format (a)
5     format (1x,'Too many characters in numeric field of this line of',/,
     1        1x,'tloop.dat file: ',a)
      end
c---------------------------------------------------------------------- 
      subroutine symint

      include 'rna.inc'
      integer test1,test2,i,j,test3,test4,i1,j1,i2,j2,x1,y1,ip,jp,
     .        i3,j3,i4,test5,flag,worst
      real rsint2(6,6,5,5),rsint4(6,6,5,5,5,5),rsint6(6,6,25,5,5,5,5)
      character rowcha*144,row2*96

c  Explanation of sint6(a,b,c,e,f,g,h); variable changes as corresponding
c  pair changes.
c  a  c   e   g  b
c     U   W   Y
c  A             C    Symmetric interior loop of size 6
c  B             D
c     V   X   Z
c         f   h 

c  Reads in energies for symmetric interior loop of size 2

      i1=0
      flag=0

 3030 format(a144)
 3031 format(24f6.2)
                     
      do while(flag.lt.4)

         read(33,3030,end=93,err=91)rowcha

         test1=index(rowcha(25:144),'<--')
         test2=index(rowcha(1:24),'                        ')

         if(test2.gt.0)then
            flag=flag+1
         elseif(test1.gt.0)then
            i1=i1+1

            do i2=1,4
               read(33,3031,err=91)((rsint2(i1,j1,i2,j2),j2=1,4),j1=1,6)
            enddo
            flag=0
         else
            flag=0
         endif
      enddo

 93   continue

      do i=1,6
         do j=1,6
            worst = 0
            do ip=1,4
               do jp=1,4
                  sint2(i,j,ip,jp) = nint(prec*rsint2(i,j,ip,jp))
                  worst = max0(worst,nint(prec*rsint2(i,j,ip,jp)))
               enddo
            enddo
            do ip = 1,5
               sint2(i,j,ip,5) = worst
               sint2(i,j,5,ip) = worst
            enddo
         enddo
      enddo

c   Reads in energies for symmetric interior loop of size 4

 3032 format(a96)
 3033 format(16f6.2)

      test3=0

      do while(test3.eq.0)
         read(34,3032) row2
         test3=index(row2,'<-----')
      enddo

      do x1=1,6
         do y1=1,6
            test4=0
            do while(test4.eq.0)
               read(34,3032,err=92) row2
               test4=index(row2,'<------')
            enddo
            do i2=1,4
               do j2=1,4
                  read(34,3032,err=92) row2
                  read(row2,3033,err=92)((rsint4(x1,y1,i2,j2,i3,j3),j3=1,4),
     .            i3=1,4)
               enddo
            enddo
         enddo
      enddo

      do i=1,6
         do j=1,6
            worst = 0
            do ip=1,4
               do jp=1,4
                  do i1=1,4
                     do j1=1,4
                        sint4(i,j,ip,jp,i1,j1) = nint(prec*
     .                  rsint4(i,j,ip,jp,i1,j1))
                        worst = max0(worst,nint(prec*rsint4(i,j,ip,jp,i1,j1)))
                     enddo
                  enddo
               enddo
            enddo
c            do ip = 1,5
c               do jp = 1,5
c                  do i1 = 1,5
c                     sint4(i,j,ip,jp,i1,5) = worst
c                     sint4(i,j,ip,jp,5,i1) = worst
c                     sint4(i,j,ip,5,jp,i1) = worst
c                     sint4(i,j,5,ip,jp,i1) = worst
c                  enddo
c               enddo
c            enddo
         enddo
      enddo

c   Reads in energies for symmetric interior loop size 6
c
c   KEY
c      c  e  g  
c   a           b    Capital letters:  RNA/DNA bases
c      U--W--Y       Lower case letters:  variables assigned to 
c   A_/       \_C                         specific bases
c   B \       / D
c      V--X--Z       sint6(a,b,c,e,f,g,h)
c      
c         f  h

c3034 format(24F6.2)

c     test1=0

c     do while(test1.eq.0)
c        read(35,3030,err=94) rowcha
c        test1=index(rowcha(41:120),'-->')
c     enddo
c     
c     do i=1,6
c        do i1=1,19
c            if ((i1/5)*5.ne.i1) then
c               do i3 = 1,4
c                 do j3 = 1,4
c                     test5 = 0
c                     do while(test5.eq.0)
c                       read(35,3030,err=94)rowcha
c                       test5=index(rowcha(41:120),'<--')
c                    enddo
c              
c                    do i2=1,4
c                       read(35,3034,err=94)((rsint6(i,j,i1,i2,j2,
c    .                  i3,j3),j2=1,4),j=1,6)
c                    enddo
c                 enddo                     
c              enddo
c           endif
c        enddo
c     enddo
c      do i=1,6
c        do j=1,6
c           do i1=1,25
c              do i2=1,5
c                 do j2=1,5
c                    do i3=1,5
c                       do j3=1,5
c                          if((i1/5)*5.eq.i1) then
c                             sint6(i,j,i1,i2,j2,i3,j3) = infinity
c                          elseif(i2.eq.5.or.j2.eq.5) then
c                             sint6(i,j,i1,i2,j2,i3,j3) = infinity
c                          elseif(i3.eq.5.or.j3.eq.5) then
c                             sint6(i,j,i1,i2,j2,i3,j3) = infinity
c                          else
c                             sint6(i,j,i1,i2,j2,i3,j3) =
c    .                        nint(rsint6(i,j,i1,i2,j2,i3,j3)*prec)
c                          endif
c                       enddo
c                    enddo
c                 enddo
c              enddo
c           enddo
c        enddo
c     enddo
c  
      return

 91   write(6,*) 'STOP: ERROR reading symmetric interior of size 2 file'
      call flush(6)
      call exit(1)

 92   write(6,*) 'STOP: ERROR reading symmetric interior of size 4 file'
      call flush(6)
      call exit(1)

c94   write(6,*) 'STOP: ERROR reading symmetric interior of size 6 file'
      call exit(1)
      end


c-----------------------------------------------------------------
      subroutine asmint

      include 'rna.inc'
      integer a,b,u,w,x,y,z,test
      character row*120
      real raint3(6,6,4,4,4),raint5(6,6,4,4,4,4,4)

 11   format(a144)
 12   format(24f6.2)

c   Reads in asymmetric interior loop of size 3 energies

      do a=1,6
         do b=1,6
            do x=1,5
               do y=1,5
                  do z=1,5
                     asint3(a,b,x,y,z)=infinity
                     
                     do u=1,5
                        do w=1,5
                           asint5(a,b,x,w,y,u,z)=infinity
                        enddo
                     enddo

                  enddo
               enddo
            enddo
         enddo
      enddo

      do a=1,6
         do z=1,4
            test=0
            do while(test.eq.0)
               read(8,11,err=91)row
               test=index(row(41:120),'<--')
            enddo

            do x=1,4
               read(8,12,err=91)((raint3(a,b,x,y,z),y=1,4),b=1,6)

               do b=1,6
                  do y=1,4
                     asint3(a,b,x,y,z)=nint(prec*raint3(a,b,x,y,z))
                  enddo
               enddo

            enddo
         enddo
      enddo

c   Reads in asymmetric interior loop of size 5 energies
c----------------------------------------------------------------
c   Diagram and explanation of asint5 dimensions:
c
c     a  x w    b
c        A-C--          asint5(a,b,x,w,y,u,z)
c  ===U_/     \_A===
c  ===G \     / U===
c        G-C-A
c        y u z           *  raint5 has same dimensions
c-----------------------------------------------------------------
cTEMP do a=1,6
cTEMP    do x=1,4
cTEMP       do y=1,4
cTEMP          do u=1,4
cTEMP             test=0
cTEMP             do while(test.eq.0)
cTEMP                read(9,11,err=92)row
cTEMP                test=index(row(41:120),'<--')
cTEMP             enddo
cTEMP             
cTEMP             do w=1,4
cTEMP                read(9,12,err=92)((raint5(a,b,x,w,y,u,z),z=1,4),b=1,6)
cTEMP                 do b=1,6
cTEMP                   do z=1,4
cTEMP                      asint5(a,b,x,w,y,u,z)=nint(prec*
cTEMP.                     raint5(a,b,x,w,y,u,z))
cTEMP                   enddo
cTEMP                enddo
cTEMP              enddo
cTEMP          enddo
cTEMP       enddo
cTEMP    enddo
cTEMP  enddo

      return

 91   write(6,*) 'STOP: ERROR reading asymmetric interior 1 x 2 file'
      call flush(6)
      call exit(1)

 92   write(6,*) 'STOP: ERROR reading asymmetric interior 2 x 3 file'
      call flush(6)
      call exit(1)
      end

c------------------------------------------------------------------
      subroutine symtest
      
      include 'rna.inc'
      integer diff,i,j,ii,jj,ip,jp,i1,i1p,j1p,i2,j2,i2p

c   Symmetry test for symmetric interior loops of size 2
      do i=1,6
         do j=1,6
            if(i.gt.4.and.i.le.6)then
               ip=11-i
            else
               ip=5-i
            endif
            if(j.gt.4.and.j.le.6)then
               jp=11-j
            else
               jp=5-j
            endif

            do ii=1,4
               do jj=1,4
                  diff=sint2(i,j,ii,jj)-sint2(jp,ip,jj,ii)
                  if(diff.ne.0)then
                     write(6,*) 'STOP: sint2 FAILED SYMMETRY TEST'
                     call flush(6)
                     write(6,93) i,j,ii,jj,sint2(i,j,ii,jj)
                     call flush(6)
 93                  format('sint2(',4i2,')= ',i6,' BUT ')
                     write(6,94) jp,ip,jj,ii,sint2(jp,ip,jj,ii)
                     call flush(6)
 94                  format('sint2(',4i2,')= ',i6,'!')
                     call exit(1)
                  endif
               enddo
            enddo
         enddo
      enddo
      
c   Symmetry test for symmetric interior loops of size 4
      do i=1,6
         do j=1,6
            if(i.gt.4.and.i.le.6)then
               ip=11-i
            else
               ip=5-i
            endif
            if(j.gt.4.and.j.le.6)then
               jp=11-j
            else
               jp=5-j
            endif

            do ii=1,4
               do jj=1,4
                  do i2=1,4
                     do j2=1,4
                        diff=sint4(i,j,ii,jj,i2,j2)-
     .                  sint4(jp,ip,j2,i2,jj,ii)
                        if(diff.ne.0)then
                           write(6,*) 'STOP: sint4 FAILED SYMMETRY TEST'
                           call flush(6)
                           write(6,*) i,j,ii,jj,i2,j2,sint4(i,j,ii,jj,i2,j2)
                           call flush(6)
                           write(6,*) jp,ip,j2,i2,jj,ii,sint4(jp,ip,j2,i2,jj,ii)
                           call flush(6)
                           call exit(1)
                        endif
                     enddo
                  enddo
               enddo
            enddo
         enddo
      enddo

c   Symmetry test for symmetric interior loops of size 6
c      do i=1,6
c         do j=1,6
c            if(i.gt.4.and.i.le.6)then
c               ip=11-i
c            else
c               ip=5-i
c            endif
c            if(j.gt.4.and.j.le.6)then
c               jp=11-j
c            else
c               jp=5-j
c            endif
c            
c            do i1=1,19
c               if ((i1/5)*5.ne.i1)) then
c                  i1p = i1/5 + 1
c                  j1p = i1 - 5*(i1/5)
c                  do i2 = 1,4
c                     do j2 = 1,4
c                        i2p = (j2-1)*5 + i2
c                        do ii = 1,4
c                           do jj = 1,4
c                              diff = sint6(i,j,i1,ii,jj,i2,j2) -
c     .                               sint6(jp,ip,i2p,jj,ii,j1p,i1p)
c                              if (diff.ne.0) then
c                                 write(6,*) 'STOP: sint6 FAILED SYMMETRY TEST'
c                                 call exit(1)
c                              endif
c                           enddo
c                        enddo
c                     enddo
c                  enddo
c               endif
c            enddo
c         enddo
c      enddo

      return
      end
