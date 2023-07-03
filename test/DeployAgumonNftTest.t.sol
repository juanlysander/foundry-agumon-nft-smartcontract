// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployAgumonNft} from "../script/DeployAgumonNft.s.sol";

contract DeployAgumonNftTest is Test {
    DeployAgumonNft public deployer;

    function setUp() public {
        deployer = new DeployAgumonNft();
    }

    function testConvertSvgToUri() public {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSIxMGNtIiBoZWlnaHQ9IjEwY20iIHZlcnNpb249IjEuMSIgc3R5bGU9InNoYXBlLXJlbmRlcmluZzpnZW9tZXRyaWNQcmVjaXNpb247IHRleHQtcmVuZGVyaW5nOmdlb21ldHJpY1ByZWNpc2lvbjsgaW1hZ2UtcmVuZGVyaW5nOm9wdGltaXplUXVhbGl0eTsgZmlsbC1ydWxlOmV2ZW5vZGQ7IGNsaXAtcnVsZTpldmVub2RkIg0Kdmlld0JveD0iMCAwIDEwMDAwIDEwMDAwIg0KIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj4NCiA8ZGVmcz4NCiAgPHN0eWxlIHR5cGU9InRleHQvY3NzIj4NCiAgIDwhW0NEQVRBWw0KICAgIC5maWwwIHtmaWxsOiNFNkM3NDR9DQogICAgLmZpbDEge2ZpbGw6I0ZFRkVGRX0NCiAgIF1dPg0KICA8L3N0eWxlPg0KIDwvZGVmcz4NCiA8ZyBpZD0iTGF5ZXJfeDAwMjBfMSI+DQogIDxtZXRhZGF0YSBpZD0iQ29yZWxDb3JwSURfMENvcmVsLUxheWVyIi8+DQogIDxnIGlkPSJfMTIwMDkzOTk1MiI+DQogICA8cmVjdCBjbGFzcz0iZmlsMCIgd2lkdGg9IjEwMDAwIiBoZWlnaHQ9IjEwMDAwIi8+DQogICA8Zz4NCiAgICA8cG9seWdvbiBjbGFzcz0iZmlsMSIgcG9pbnRzPSI0Mjc5LDI5NDAgNTcyMSwyOTQwIDUwMDAsMjIxOSAiLz4NCiAgICA8cG9seWdvbiBjbGFzcz0iZmlsMSIgcG9pbnRzPSIzMDM0LDQwNTMgNDA1MywzMDM0IDMwMzQsMzAzNCAiLz4NCiAgICA8cG9seWdvbiBjbGFzcz0iZmlsMSIgcG9pbnRzPSIyOTQwLDU3MjEgMjk0MCw0Mjc5IDIyMTksNTAwMCAiLz4NCiAgICA8cGF0aCBjbGFzcz0iZmlsMSIgZD0iTTMzMTMgNTAwMGMwLDkzMiA3NTUsMTY4NyAxNjg3LDE2ODcgOTMyLDAgMTY4NywtNzU1IDE2ODcsLTE2ODcgMCwtOTMyIC03NTUsLTE2ODcgLTE2ODcsLTE2ODcgLTkzMiwwIC0xNjg3LDc1NSAtMTY4NywxNjg3em0xNjg3IDExMDljLTYxMiwwIC0xMTA5LC00OTcgLTExMDksLTExMDkgMCwtNjEyIDQ5NywtMTEwOSAxMTA5LC0xMTA5IDYxMiwwIDExMDksNDk3IDExMDksMTEwOSAwLDYxMiAtNDk3LDExMDkgLTExMDksMTEwOXoiLz4NCiAgICA8cGF0aCBjbGFzcz0iZmlsMSIgZD0iTTQ0NDkgNTAwMGMwLDMwNCAyNDcsNTUxIDU1MSw1NTEgMzA0LDAgNTUxLC0yNDcgNTUxLC01NTEgMCwtMzA0IC0yNDcsLTU1MSAtNTUxLC01NTEgLTMwNCwwIC01NTEsMjQ3IC01NTEsNTUxeiIvPg0KICAgIDxwb2x5Z29uIGNsYXNzPSJmaWwxIiBwb2ludHM9IjQwNTMsNjk2NiAzMDM0LDU5NDcgMzAzNCw2OTY2ICIvPg0KICAgIDxwb2x5Z29uIGNsYXNzPSJmaWwxIiBwb2ludHM9IjU3MjEsNzA2MCA0Mjc5LDcwNjAgNTAwMCw3NzgxICIvPg0KICAgIDxwb2x5Z29uIGNsYXNzPSJmaWwxIiBwb2ludHM9IjY5NjYsNTk0NyA1OTQ3LDY5NjYgNjk2Niw2OTY2ICIvPg0KICAgIDxwb2x5Z29uIGNsYXNzPSJmaWwxIiBwb2ludHM9IjcwNjAsNDI3OSA3MDYwLDU3MjEgNzc4MSw1MDAwICIvPg0KICAgIDxwb2x5Z29uIGNsYXNzPSJmaWwxIiBwb2ludHM9IjU5NDcsMzAzNCA2OTY2LDQwNTMgNjk2NiwzMDM0ICIvPg0KICAgPC9nPg0KICA8L2c+DQogPC9nPg0KPC9zdmc+";
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" width="10cm" height="10cm" version="1.1" style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd"viewBox="0 0 10000 10000"xmlns:xlink="http://www.w3.org/1999/xlink"><defs><style type="text/css"><![CDATA[.fil0 {fill:#E6C744}.fil1 {fill:#FEFEFE}]]></style></defs><g id="Layer_x0020_1"><metadata id="CorelCorpID_0Corel-Layer"/><g id="_1200939952"><rect class="fil0" width="10000" height="10000"/><g><polygon class="fil1" points="4279,2940 5721,2940 5000,2219 "/><polygon class="fil1" points="3034,4053 4053,3034 3034,3034 "/><polygon class="fil1" points="2940,5721 2940,4279 2219,5000 "/><path class="fil1" d="M3313 5000c0,932 755,1687 1687,1687 932,0 1687,-755 1687,-1687 0,-932 -755,-1687 -1687,-1687 -932,0 -1687,755 -1687,1687zm1687 1109c-612,0 -1109,-497 -1109,-1109 0,-612 497,-1109 1109,-1109 612,0 1109,497 1109,1109 0,612 -497,1109 -1109,1109z"/><path class="fil1" d="M4449 5000c0,304 247,551 551,551 304,0 551,-247 551,-551 0,-304 -247,-551 -551,-551 -304,0 -551,247 -551,551z"/><polygon class="fil1" points="4053,6966 3034,5947 3034,6966 "/><polygon class="fil1" points="5721,7060 4279,7060 5000,7781 "/><polygon class="fil1" points="6966,5947 5947,6966 6966,6966 "/><polygon class="fil1" points="7060,4279 7060,5721 7781,5000 "/><polygon class="fil1" points="5947,3034 6966,4053 6966,3034 "/></g></g></g></svg>';
        string memory actualUri = deployer.svgToImageUri(svg);
        assertEq(
            keccak256(abi.encodePacked(actualUri)),
            keccak256(abi.encodePacked(expectedUri))
        );
        console.log();
    }
}
