program test_clear_new
  
  implicit none
  integer n
  character(len=5) K
  character(len=5) yyyy, mm, dd
  integer i

  integer c
  open (17, file='JMA_seismic_data_2000.dat', status='old')

  open (27, file='Kumamoto_2000_new.dat', status='unknown')
  ! === レコード数を調べる ===
  n = 0
  read (17, '()')
  do
    read (17, *, end=100) K, yyyy, mm, dd  ! ファイル終端ならば999に飛ぶ
    n = n + 1
  end do
100 continue
 rewind (17)

  ! ファイルの最初に戻る

  print *, 'NumRec =', n

  ! === 読み込む ===
  ! 読み飛ばす
 ! do i = 1,14
  !  read(17,*)
 ! end do

 !!! なんか変

 ! 読み始める
  read (17, '()')
  do i = 1, n
    read (17, *) K, yyyy, mm, dd
    do
     c = 0 

     if (dd = dd)then
      c = c + 1
     endif
    enddo

    write(27, *) yyyy, mm, dd, c,"回"
    
    write(27, *) K, yyyy, mm, dd
  end do

  close (27)
  close (17)

end program test_clear_new