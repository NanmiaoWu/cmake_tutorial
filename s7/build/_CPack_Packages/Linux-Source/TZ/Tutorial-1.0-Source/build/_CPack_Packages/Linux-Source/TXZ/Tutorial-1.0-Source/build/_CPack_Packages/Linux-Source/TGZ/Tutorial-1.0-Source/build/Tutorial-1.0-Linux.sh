#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --version         print cmake installer version
  --prefix=dir      directory in which to install
  --include-subdir  include the Tutorial-1.0-Linux subdirectory
  --exclude-subdir  exclude the Tutorial-1.0-Linux subdirectory
  --skip-license    accept license
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "Tutorial Installer Version: 1.0, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
This is the open source License.txt file introduced in
CMake/Tutorial/s7...

____cpack__here_doc____
    echo
    while true
      do
        echo "Do you accept the license? [yn]: "
        read line leftover
        case ${line} in
          y* | Y*)
            cpack_license_accepted=TRUE
            break;;
          n* | N* | q* | Q* | e* | E*)
            echo "License not accepted. Exiting ..."
            exit 1;;
        esac
      done
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the Tutorial will be installed in:"
    echo "  \"${toplevel}/Tutorial-1.0-Linux\""
    echo "Do you want to include the subdirectory Tutorial-1.0-Linux?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/Tutorial-1.0-Linux"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +152 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the Tutorial-1.0-Linux"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;
� ��/` �\t�u~����V˯e�@��,����1�aaeKXA����vW�K���,�!!�I�!%uS5qN�6��#nOj�9�.�>9.4��MKەb�Q�������7og�v0i�s�;�{��w�Ｙsw��X.�XM������kk���ڀH��B�@M}]}0T�.PK����(�rY-�SR��@2����P>k�A���$���ַ1��i�t*�뻨u@ԅB��� �`]Mƿ�6�￨Vؤ?��O�������m9�V�8��m�L����Μ��$����TO���n Z��@����5������)��Պ֗Pbt�s�D\I�{�MŕlBӒ�ެғ�(|���@<ѓL%@�=�����j[�-�mQ�h�~C��#��������n~?�;�zO�~����/X
Μ�.E����������_S
�?P�����3���H	�nt:�"7�*u����k
e�2���,&���r2�r�i�Q�^n�S�e�>b����Ӟ��͔�(��N1�S�SLt�����\���U/���Ŋ�z��������N��t1S^m�KZ�����駈��r�r���'/�[X}v�R���S>����u����U��Tnh�К�Uu!_6�R��Lv��.*�ŝ������+�t�+7'�:��Jⵏ����l�A�E�0n���0LF+��׾GA�\\uX���e�vb-��5��س������m�=�����|�F��M��lp�F��W�9m��w������{m�w��s���|�z�C�s�d������!��c+W��#��;�N�xs�T��-�mj<�I�&�Z"���ܟN%:���Y�ܹ�#ݟǍ�$��������th�D*�����X_4�j�hR˂���@Mw4���鬖IDZ:�N��Si�`HU��L�5���O��h�77�Hi���hMZ��Ɔ��@PWz����:jU�9��[n��Quk��
e��TRcV�i߸�#ݡ�������D&�N��u��hh3+r�;7����~�϶��>�uBժF�[��y��F,��i� ��  ��{�L4՛��a:��@'Φ Q�R$SquK"Ã�1>�`���Sc}��=�d?#�4�0-�F��PjR�L*���cQ|�c���� L3��:M�Ȧ�f���'�[�66��_����,�!����p����	;�v�J���{�(-���2��{�~�,�=�Aڝ�u�~͎�P�yv�p@i[����o���;�	VF[��r��3��?��N����(�$���o~2Y�'���-J�B�K��θ2y��.��4SX.��t��S�|U��qΏ-�)��\��󌀗�1/�.�g�|����B��j��+����Ǌ'�o�n��70=e�p��p����x�*��y�^/�>�%��.�&��2�]^!�x����G�G�J���? �������'�r��Z����<�Dv�i��c������� M_]���4���=8qj��N�q�&�Q��\�q�&�(�:�8�'R����ԝ�O��#�C81B�A�nb��	y4wb���!�C8q/��<�D;��y���?�<Մ��!�C4�P�/�ǡ��R����L�y���s����o�_��o��~q���u��:�5���K��;2��C���Z��B��n���)mt��z�Ϛ>U�d�=�(��̽���Ȋs��d��k�#��\Ǒ��s�|Pp5SP>}������Z�5���VwE��=?.#����Ȟu����*h�x�;��(�9�9,�?�G��e:`���w>��F�=%W/G��������GU��D~Ox$��#`�R��}�g`�j����J`�� :3��-fy����׉y�@Ӗ�Ѩ0����xͭw-d��-&gTr_��w�F�������� >A��Oh7����o�(���P���m�����}Tox̰�	�D�>ჺ���Y�շN�w�Rc�G��'��Z�!S`��o����h�G�v,c�8f�<a��m��L�Ѷ��'��{��㑚
:XZ𕕑�anf7���j�g���x�2\����}w�s' ��7��l>75��#��Ω�i�Y+��p(����W���a��~�Zut�2G�����Ş®�
L���H~�L�Ih����[���H��|хMrW3�QP���=Pd�������j1�բ�=���k��5�gn��,|�jNx�v�n��P�	��`$�u �o�/-���Q��]�����P���������c����
k,����/�A����is?�O�4({hL+��75	x��l��>�����Oh�c��P;�����D�N�H�(����� �3Do����E���Bϝ3&ď��]g�	��zO�T�z��ju�df^N����U���[���U�e���u����
#��+�J�G�����Ҙ�/�6Zz�X�1����}'AN���v4�*��;_�U��)�u��Mf*�ڛ�h3k��j�3�W���|�!:��]��}9��m�@��Je&��#j�hs-����|�4]��;��;��4D�h4��
���a]�_uL�O�m�|���(�.T��7�tΫ������U-yH_(�j��%��ƮF��]}�\!]���^�ј�%�F늗�Y��[��oB���)���������n������Î�ڟ�~�g���i����m���B��9��������!a���y�V�#]�ho��(��@w"C:�J��\4�P2鴦�{ /�U
癮l�����AZ��J_�P�G��M)Ix�KF�x��%Ҝ��._��ڠHw�+�\�ӫ>�g��d����+]7�/ϸ�ޘ�>���-�]~ �K@��2��rh�jX��G� �����1���:�g@O}7V����'��@џt��xΙd�c~�s<��8���++��Ge^������,t��<���h�qx�=շT]�@�.�~э��\���G�8ȉ�j,{7���f=ޏ;�+Kw@D��>��Jk.���Y
�R��v��h[ɗ�a��MU�z���30����.��"�9��痀�Y���o��цo��iп�J��;Z!��u��ǹ����i�_ �����t���h�������C�W�Z��1z��'0�����l�T��({K�<�?�x�/�x���y2�5��gy�G9�o��y����c0J�߀N�O8�/�Ȩ����u~�A�fo�k�Av;�繟I3i&ͤK�������������"mw���s�O9�ྞ����Ƹ?�J�s_��q?!�?�{�����GY}|'����c��g5�9����'��0q�r��{�.�P~N�E�;zx�Wf���c�o���~b���m��A�?����d��,�4�߫;�+�:6����F�3�qF?��_1�]F�0z�ї}��R6�2z��L����ϟ&��=~�c������}n��������I�W����/���}z��p|��?|���HM�����6�Z��M��7(˻�s)-��������e����C��
=�V��5N+�i�o7�.�Y�%��2�nc]��Rc���2c^��rc>��Yƺ1㳍�e�/3�3^AK���-拋x�83^e�[f�KF,�9F|��K�Y��H��
�o�f|��/��������8Tj1�]��\3�������紌c�;�?���0|��/e�)	��u\AF�*F}�6���~`z�	&;�|q�����T�K�_h'�1f�g${���{��0|����ʇ��������6�~u����;t���y�v�U����d��<��S���V��xF������0\��TO���M�9T�!i��u�{��y���e�?�d�r-���x�º���9u�H�9����m�g<�~���O�GO��Y7�9���Q��Z>n�𥠇�����R�/�ߞ���o6�B��.�r�ʔ���]��e�	)����w��7�v�-��S�'J��X����u��M�Wt^AF����n}��a/+�;�����w�zd;�2=173��Rk=�R���l|o�����C��qA����?������ǈ�z����Y��A����7�V�?Qfm��l�i#�ʁ��W����e��Ƣrk�$�ѲZ���#�x'UPcה%�O�����h��ҙ���Xz`�?�%�5�5u�B��T��Lt��Hi��'H�����("p*:xM��q�ņ�h�Mk`�`2K<��&�X:��2���ӺFU�iTl(@cl�dLe^��4�F���j<��CޟLuS�mM��P$׭���4�O���و�H/u�ƶ�޼���M���p���[���͍m-͐gj[�����6n�w���M�a�(��A�Q��߹y����r�T�mOG[���-�p�ӯ�o�T�o����5��Π�_/5б�Ԏ���^���rh�'Sj.��_�.Bt�B<�9<J�wqg�gx6����q~�œʾ�賢�n��/���Y���dR녰��~yvr����/�,�)��9 �`%�u�5�%���.B�
1�s	�_������[0B�W�v 	����dJK�f`��;Y4��t�v����G�]ם��
���q�-�n�P�n����'�Ji�a,�S��b*64q�F$���|���I(Ǣ�S[�𦃒�ø]�-/�[��)/Ts�1$��4���z���h`�Eė�1�E����Ci��9�$�TZK�`:�Ң��;}ݹd|U2N(���_|G
��T��9����&F��L�?���j�_�*aJ⥯7���:#|�4�_�}����8�����XbPS�;h]�~��u�k�3:���U����<�[���%�3�ђ�;�~gÓC�?@̱���XI�D�Ry�w�������oLO�yy���s7��^�Lt�7/��x�>�(��By�������}���sIq�m#��~AN�$�����p�s��AI�~)n��D�S^��9��y��x�b�������_nQ��D�O���b*!�㟗�s�&�^�ý}D*������U.�?����c�I�&�XgL_��s����Wn�׈y�r?�m���;Ry�ߓ����T��s9���r��J�ߗ����~^ ��/����t^v����D����?λ��^��o�9���?�O�?�r|��6��ז/������T��02$�W$��^�����3���o�ʗ9���0���n�����	9��` �3"�����~�N�K(ϟ96��u*�r���	N��;������H8��g��S���q��ԇBA��/����������/EZzS4�y�jŜ�E�~^���I���\�g����W�G;N��>���/8�
�4&�)o`�����nBձt!T�q,T���uH��5��֯h�6^Z�������K��Pu]�.T��f!T]����G�I��US�i�z����z�b�z�P�����ӥ�$7*|��1v�x��O�v�7�|���Y�UD�]�{��es�rY���k�8즂�]�yM���"�����7�<����O�7r�z����*z���w�\E��8�V����}����B�q{?I��61=b�?f���_��}6���QxJ�=6�9���R�����	��~����6�;|�A�������00����T��=��!�����&	���/�|%~H�q��N��9(7W�{�~��~A~����{�I�^���zf<���\��?Q��_%�|�����F�&=tX��݂��?#B�%�'��BT��\��l��1��j\����f��*¸��H���}�^	�z��j�z�u����.~�+z�w^��is�*�ґI� .NR�ك(���x0����.�F��r��n���H(n+�U�%�zb�@��=���2 �^$^~P��;+F�D�Ɲ��n-��qv�����WJ���b�A��[%���X{�[��d��u�)���A��#F��Ϗ6�V0Hn��p��?�2��cQ��X���.0��<����	�C� Τ�4��P�� �UA� b  