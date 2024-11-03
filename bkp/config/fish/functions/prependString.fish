# note that this requires GNU chmod, though it works if you have it installed
# under a different name (f/e, installing "coreutils" on MacOS with nixpkgs,
# macports, etc), it tries to figure that out.
function copy_file_permissions -a srcfile destfile
   if command -v coreutils &>/dev/null  # works with Nixpkgs-installed coreutils on Mac
      coreutils --coreutils-prog=chmod --reference=$srcfile -- $destfile
   else if command -v gchmod &>/dev/null  # works w/ Homebrew coreutils on Mac
      gchmod --reference=$srcfile -- $destfile
   else
      # hope that just "chmod" is the GNU version, or --reference won't work
      chmod --reference=$srcfile -- $destfile
   end
end

function mysponge -a destname
   set tempfile (mktemp -t $destname.XXXXXX)
   if test -e $destname
      copy_file_permissions $destname $tempfile
   end
   cat >$tempfile
   mv -- $tempfile $destname
end

function prependString -a stringToPrepend outputName
   begin
      echo $stringToPrepend
      cat -- $outputName
   end | mysponge $outputName
end
