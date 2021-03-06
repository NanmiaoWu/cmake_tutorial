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
� ��/` �\t�u~����V˯e�@��,��J�����%� ���W�+i��]yw���8�������	�I���'�ۜXl���p�%��J�ⴶ ��7�;y;��$m�Α����w�}�����I$�}�X|%���ﯫ�Q��j"5���u�u�uU
\�VU���4��lF����d$ٟ��l�Ε��a��#)�ƿ5����&�Z"���z�k����Yƿ���Umuƿ�&XC�y��&�����X*��W��e�NkK7��ڙ�o˦ӅH|�wd�T:�kJ%�=�w8���
��?PS��.�^�"�\�h�q%J�=��ǔ� �(�dL��5-���(ݩ�§�̏��݉d� ԛC�ڛoڨ�6�p�&%p�� �7:�Cj�-�����������齟���j����p��2���8��W������a��5�����B�O�Z�;�w��	r��:_����2�d��?J�b��9�N:̴ԨG/�ʩ�2�1S�@�gi�ݕfJ�b�C['��ɏ(&����Yd.�d�*�h�B�D��^Ny���_�e���)���%-F�s����s�Ly��C�b��M�>�~)e��)��}����ʾ؊�D2;�bpU�ڠ/��UQ��Lv��N*�ŝ��s�����|�+�'n;��J�������[�Qvɏjt0Ӽ������QP0�W���A~���X���F��6����l��j<ac�=6�b#_e#̦�56�j��+˜��Ի�F�l�6�;m��F~�M�K��Y��C�Ky������b���q�U��O%U��h�J��V5O�{-��hm�K%�x���sn�؞�˄b�U�^E���u��V`ڵ`<�k��k�@�7�V�t$�e@��Z��+�ID�TFK�#��j�_�ת�hUPU��t�5���K��H�'�Ojm7FiMZ��F�@�����UuԪPS e7��^��
V%R�ƃ�ɄƬ�Ӷ~S{�]ag��t&�3�m�V���&V���nLa�ԗi~w}��Q�.0����ޭɏX4����� DMu��H�'�5�tꉂN�M�v&�I$c�x�3�|���ޥF{�R�#�>Fh)�/`ZD�h��Ԥ���dJ�KE#�l�r�	:�^�f**ds�?�H�MMj��O�6onhlV�j����X��ⵯ*��jπ�*�ݝ��;a�/�T�*�����bz(�������"���͙_�mWl���g7�v�u^?��]n�Cce�e�/EM�`�ݓ��;�kFy'�w��s�r<Q�fXvAbZ^��w�}��+v�Ќ���R	���S���`�RŌs~t�N�����g�H��x��pq?;!��|L�����W
���_"�^�>V<�}�p���)!�3���;�M����f�Cw
x���
�p�71(����2P��|X�=>"��W�g	�>�#��|��?!�xx����.�O�($�sTsN	=]z�L��h��2�_��������S�.w"�C6~��f�C5>J�7��)<���F���^��y��a���8t�;(�/ȣ���y��;)�#�q���(��㐍�S�q�q����y�q���<͸��_D�d�P����P�O�A���w�~�֜;�%��ex�ŉ����������-F�� �L��
e��b�:
9��w���«'�y��g��>c�DŢ�� � 3w�`���΄s����t���G�hsA��LA�ԉnZ/�c�7�:�]�Z��,��^��»�̄"c+�Ec����� ��T���@f'�i�қ��h8���w]��˅��C�uT�y�]���.��݋���@���+�7r��ʁ����̀�������#,��r?��-�Qa�gc��-�[�Z���;LΨ侮�=��u�p�1���O|�N۟�n}E�AQ�54
ˡ4���5�=��{��Шae#(�W|B�u��c3t)�o��o?%G�9��O��5zC&���ߞ�х��O��X��q�y���h۩
�m�OPw�����et���W��s��] �K��S����e�����{o�� N on��\vrh�iG����'��`f-�l�����=^A�k�m��j��"�~�*�!{
�~�k0���ù�0�&���Xf��x{'¹��E6�]�tF@ų��cw@�]^T��s��R�y�$W�rd�h�|�*�eW���9/��͊Y�Iځ�qt�C�'����\�p�u����F�Oa/t�A�C�c O��~2��W��e�p���3����z
-�\����>aR���Q��N�W��$������
o�8Z|"<�}/�ŏ��C�����s^i="�#��7��G@g��m�+�	A��;cL����;N���xc��be�xz^�����U��[�=��+�o��M���#��+��r�G�'����ܘ�/�4Zz�h�1�����}+AN���v8�*�C�_�Q��)�u��M�˱��h3k��b�3oV���|�:��]��}1��-�@+��Le&��Cj�5hs����|�$]��;��;��0D�l4��2��'a]�^u��M�m�x���0�����w�t�)��Ф���U,�__(�h��9������]~�T!���+^�ސ{�9�V˲��Y��;���oC�;_Ӕ�\AK�TK�u�7���{x�#����_�Y�;no��aK�zp8_�o��=m��sx��G�fx����Hg&��F!J2��O��޸��;IǕt*�)�n�Kd��y�3�/�4|�V����P��'�D�J��>z�q�4�����K���6(��
'�����/��'b��R׵��3����4t=�B����������V-����>�;�>t/У@G���	�o��
�=��d�(��� ��9�p��z�{7Ǡ�qiYI鰣ċ8�������n����2ym�>�w��򆊋�)�A�.����˖����9�\�eo��6_�@�������xT@��m-��/휡�K���o'�뀶}ő�r��vPE��i�;s�J���|=/�}~���^1�F=m�����A��J��,oGd��n�8��}�?�����������!�u� �s�w����ik�8F���8�7z�{���ʇ\!����ѳ�s���@qسj���S���j��<K=
ȁ|����� n֠G|�Q��tZ~��~�EF���\��;�5s�m��y6��t�N�i:]���x�o��t�/'�oi����3��|J�����n��7����2��Ҹ/��	����S���}�<���;i�]p_�(��>���y�}U�>�燉��2���w���s�-r�у3͸2�lw/+�}k������h�:��a&0�xn��oe�'�a�a��^9ղ�^��͌v3��������=��1F_f�-F�ل����3�<$�w>{�X���5�}q�[k���{��;v&�_{�웃�rԯ/�S�Ј���N~�*w���ޱ��-�g��sM���Q�vve�ZVY����WY��?X��}�ez�9��7��V��x�n�]D�ċ��e��ƺ2����3�%Ƽ4��|6�3�uc�g�ˌ_d�3f��(�x9�[��qf��ط̸�[Ⳍ�3>����p�>����<c_4��-ץv'���q��b�����f|A��Y�͔�c�;�?���0|��/f�		��u\B�+F}�����~�gz�	&ۨ|a�����T�K��o'�Qf�Ò=��꽂�?�>�p~_��?�q�z����y�z�>�\�G:���^��s`�l��bZɇ���|3�S8#T~n�x�.��N��p�~�&�I�*ɠ4og��i�<G��_�q���sh<C~]�w�K����$��M���6�3j��\�槃��'l�,��,ge����e-����b���C�m�H1��o����|�[o�?�Oe�F~M�._�2؄Y�w��;l�kh�
����)ϓ}E�q,O������&ϫ~:/!#���B�>f������Z�?�u=���������~Q�����^6�q����Gl��b븠Gl�e�b��`��cıb�]�Y��g�?��z��P+��)���6�߶�_���P	ë�nf���}cA��~Mk-��틒|�����Q�k�U��Ԟ�TW�O�i�tF�dI4�?���1�*��Zk!XI��t:�M�'��6ҝ����X��8�&Q��8����4��%�z ���Id�j4��h�lT��iY���� 6�16Z"�2�q�^E�F�15��!�O$����Ɔ(��R��`��Uz��l�Y���~SCkHm\��bꆍ�j(���MD]w�Ɔ��&�3�-fh�Q�M�׷�:Ԏ�Ɩ�ZT_/���XD�@�oݸZU{�Yn�Ŷ�"ͱX�P(��W��w�m7vԶ��ju�@G��_/�߾����ָ^���|h�%�j6����Ct�|<�9<J��qg�gx&����q~�œʾ�賂����/��Y���dR녰��~yvr�j��+�,�)��9 .o%�u�6�%����C�
1�s	�_�x���M!�ͫUۑ�b`V]"��{Ұ[ҝ,�Ԛ�Z����٣���dK�~���Ц7���KBm�v��r�4�0�ɪ��k1��8D#V�s� [S�$�cэb���Ux�A�0n�{˫�-O�ٔ�9��[t�M��y�T���h`�Eė�֯E����Ci/��9� �dJ��`:��"=�;}]�D_lE"F(���_l[��TK�9[���&F��t�/���j�O�*aJ⥯'���:#|��_�����K�9�����h|@S�;h]�~��u�k�3ҟ��U����<�[���%�3�ђ�;�~gÓC�?F̱���XI�H�Ry�w���s����oMM�xy���s7��^�Ht�7/��x�>�(��By�������}���sIa�m!��~ANk%�����p�s��AI�~)l��D�S^��9��y��x��g�������_lQ�!"��'�~�S1�����I��S���^�>"��~PN��*��_J���1�([s�3��J�߁S��+��ļ~�����6���=�������J*����J~q��g������2I^^?/݇ʗY��i:/�����/��Q����]hm�\��������'�b9>FX���kK���s�Z*o�_��+�d/�xy��d��R��K�Kz��[^�j	�zoj���c����É������bj�J�k����,��{�t*�r���	N�����N���B$�3�)r~�8��_��*��/u��������/DZ|]$��~�JŜ��~^�w�I��n�\�yg����V�E;N��.Pŵ�_(p�/�iTxS^��W������c�|�:�X�:r��k���k��_��m��Ug9�2T]�~��꺰]����B������"f����P�����r�z�v�����/B��InT�Cc�"��Dş��"��c�vŷ�|��b�d�����|�<��9�xa�M�;�󚮤�E8>y;��oby$A7ß�o�L�Zc�U��q��Z�
�;`q<��������7m�~��~�>mbz������a��l�U6x�#��$�;l�6��=څz�gy;~�o���}m�|�A�������00����T��=�!�����F	���/�|%~B�q�OO��9(7[���~s�nA~����{�I�^���zf<���\��?Q��_&��|�����F�=wX��킼�?�B�E�g��|T��X��j��1��J\����f��*¸��H���}�N	�z��j�z�u����.~�+z�w^��ac�
�ґI� �OR�ك(���sx0����.����r��n���H(n+�Y�%�jb�@��=���2 �^$^~@��;+F�D�Ɯ��n5��1v�����WL
��b�A��[!���X{�Z�
d{�u�)���A��#J��Ϗ6aƖ1Hn��p��?�2��cQ��X��}��v@��Ѵ���y ��t�N���r� b  